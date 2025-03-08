package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.ReturnOrders;

@Data
public class ReturnOrderVo
{
    ReturnOrders returnOrder;
    OrderVo orderVo;
}
