package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LogModel {
    private long id;
    private String ip;
    private String level;
    private String address;
    private String preValue;
    private String value;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
// research xem ip được gửi từ quốc gia nào; trong ip2location