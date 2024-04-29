package com.ltweb_servlet_ecommerce.model;

import lombok.*;

import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class VoucherModel extends AbstractModel<VoucherModel>{
    private String name;
    private String code;
    private Timestamp startDate;
    private Timestamp endDate;
    private int usageLimit;
    private String shortDescription;
    private boolean active;
}
