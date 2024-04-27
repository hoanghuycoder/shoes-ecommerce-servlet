package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ImportOrderModel  extends AbstractModel<ImportOrderModel>{
    private String supplier;
    private double totalPrice;
}
