package com.ltweb_servlet_ecommerce.log;

import com.ltweb_servlet_ecommerce.log.LogManager;
import com.ltweb_servlet_ecommerce.model.LogModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.json.JSONObject;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoggerHelper {
    private static final LogManager logger = LogManager.getInstance();

    private String ip;
    private String level;
    private String resource;
    private JSONObject preValue;
    private JSONObject value;

    public static void log(String ip, String level, String resource, JSONObject value) {
        log(ip, level, resource, null, value);
    }

    public static void log(String ip, String level, String resource, JSONObject preValue, JSONObject value) {
        LogModel log = LogModel.builder()
                .ip(ip)
                .level(level)
                .resource(resource)
                .value(value)
                .preValue(preValue)
                .build();
        logger.submit(log);
    }

}

