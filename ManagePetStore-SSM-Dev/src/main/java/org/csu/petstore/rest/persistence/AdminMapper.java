package org.csu.petstore.rest.persistence;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.csu.petstore.rest.entity.Admin;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface AdminMapper {

    @Select("SELECT * FROM admin")
    List<Admin> findAll();

    @Select("SELECT * FROM admin WHERE username = #{username}")
    Admin findByUsername(String username);

    @Select("SELECT * FROM admin WHERE username = #{username} AND password = #{password}")
    Admin findByUsernameAndPassword(String username, String password);

    @Insert("INSERT INTO admin (username, password) VALUES (#{username}, #{password})")
    int insert(String username, String password);
}
