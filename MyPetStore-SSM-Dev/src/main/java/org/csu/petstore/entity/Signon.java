package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("signon")
public class Signon {
    private String username;
    private String password;
}
