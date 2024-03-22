package com.ltweb_servlet_ecommerce.log;

import com.ltweb_servlet_ecommerce.model.LogModel;
import com.ltweb_servlet_ecommerce.utils.IPAddressHolder;
import lombok.Builder;
import lombok.Data;
import org.json.JSONObject;

@Data
@Builder
public class LoggerHelper {
    private static final LogManager logger = LogManager.getInstance();

    public static void log(String level, String action, String resource, JSONObject value) {
        log(level, action, resource, null, value);
    }

    public static void log(String level, String action, String resource, JSONObject preValue, JSONObject value) {
        LogModel log = LogModel.builder()
                .ip(IPAddressHolder.getIPAddress())
                .level(level)
                .action(action)
                .resource(resource)
                .value(value)
                .preValue(preValue)
                .build();
        logger.submit(log);
    }

}

