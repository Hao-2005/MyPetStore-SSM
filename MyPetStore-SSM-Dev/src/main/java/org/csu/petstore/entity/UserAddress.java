package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("useraddress")
public class UserAddress {
    @TableId(value = "userid")
    private String username;
    @TableField(value = "addrid")
    private String addrId;
    @TableField(value = "firstname")
    private String firstName;
    @TableField(value = "lastname")
    private String lastName;
    private String status;
    @TableField(value = "addr1")
    private String address1;
    @TableField(value = "addr2")
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
}
