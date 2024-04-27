package com.ltweb_servlet_ecommerce.service.impl;

import com.ltweb_servlet_ecommerce.constant.SystemConstant;
import com.ltweb_servlet_ecommerce.dao.IRoleDAO;
import com.ltweb_servlet_ecommerce.dao.IUserDAO;
import com.ltweb_servlet_ecommerce.log.LoggerHelper;
import com.ltweb_servlet_ecommerce.model.RoleModel;
import com.ltweb_servlet_ecommerce.model.UserModel;
import com.ltweb_servlet_ecommerce.paging.Pageble;
import com.ltweb_servlet_ecommerce.service.IUserService;
import com.ltweb_servlet_ecommerce.subquery.SubQuery;
import com.ltweb_servlet_ecommerce.utils.JSONObjectUtil;
import com.ltweb_servlet_ecommerce.utils.ObjectComparator;
import com.ltweb_servlet_ecommerce.utils.RuntimeInfo;
import com.restfb.types.User;
import org.json.JSONObject;

import javax.inject.Inject;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserService implements IUserService {
    @Inject
    IUserDAO userDAO;
    @Inject
    IRoleDAO roleDAO;
    private List<UserModel> appendRoleForUsers(List<UserModel> listUser) throws SQLException {
        List<RoleModel> listRole = roleDAO.findAll(null);
        Map<Long, RoleModel> roleMap = listRole.stream()
                .collect(Collectors.toMap(RoleModel::getId, role -> role));
//        Loop để lấy role
        for (UserModel user : listUser) {
            if (user.getRoleId() != null) {
                RoleModel matchedRole = roleMap.get(user.getRoleId());
                user.setRole(matchedRole);
            }
        }
        return listUser;
    }

    @Override
    public List<UserModel> findAllWithFilter(UserModel model, Pageble pageble) throws SQLException {
        List<UserModel> listUser = userDAO.findAllWithFilter(model, pageble);
       return appendRoleForUsers(listUser);
    }

    @Override
    public UserModel findWithFilter(UserModel model) throws SQLException {
        UserModel user = userDAO.findWithFilter(model);
        if (user!=null) {
            RoleModel role = roleDAO.findById(user.getRoleId());
            user.setRole(role);
        }
        return user;
    }

    @Override
    public List<UserModel> findByColumnValues(List<SubQuery> subQueryList, Pageble pageble) throws SQLException {
        List<UserModel> listUser = userDAO.findByColumnValues(subQueryList, pageble);
        return appendRoleForUsers(listUser);
    }

    @Override
    public Map<String, Object> findWithCustomSQL(String sql, List<Object> params) throws SQLException {
        return userDAO.findWithCustomSQL(sql, params);
    }


    @Override
    public UserModel update(UserModel model) throws SQLException {
        model.setRole(null);
        UserModel oldModel = findById(model.getId());
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        userDAO.update(model);
        UserModel newModel = findById(model.getId());
        LinkedHashMap<String, String>[] results = ObjectComparator.compareObjects(oldModel, newModel);

        // Logging
        JSONObject preValue = new JSONObject();
        JSONObject preValueObject = new JSONObject(results[0]);
        JSONObjectUtil.removeKeys(preValueObject, List.of("password","userName","role"));
        preValue.put(SystemConstant.VALUE_LOG, preValueObject);

        JSONObject value = new JSONObject();
        value.put(SystemConstant.STATUS_LOG, "UpdatedAt and lastLogged fields successfully updated");
        JSONObject valueObject = new JSONObject(results[1]);
        JSONObjectUtil.removeKeys(valueObject, List.of("password","userName","role"));
        value.put(SystemConstant.VALUE_LOG, valueObject);

        LoggerHelper.log(SystemConstant.WARN_LEVEL, "UPDATE", RuntimeInfo.getCallerClassNameAndLineNumber(), preValue, value);
        return newModel;
    }


    @Override
    public UserModel delete(Long id) throws SQLException {
        UserModel oldModel = findById(id);
        userDAO.delete(id);
        return oldModel;
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) throws SQLException {
        List<UserModel> listUser =  userDAO.findAll(pageble);
        return appendRoleForUsers(listUser);
    }

    @Override
    public UserModel softDelete(Long id) throws SQLException {
        UserModel model = findById(id);
        model.setUpdateAt(new Timestamp(System.currentTimeMillis()));
        model.setIsDeleted(true);
        update(model);
        return findById(model.getId());
    }

    @Override
    public UserModel findById(Long id) throws SQLException {
        UserModel user = userDAO.findById(id);
        if (user!=null) {
            RoleModel role = roleDAO.findById(user.getRoleId());
            user.setRole(role);
        }
        return user;
    }

    @Override
    public UserModel save(UserModel model) throws SQLException {
        model.setRole(null);
        Long productId = userDAO.save(model);
        return findById(productId);
    }
}
