package com.zym.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @program: User
 * @description: 学生和老师类
 * @author: Mr.Zou
 * @create: 2021-11-10 17:46
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class User {
    private Integer id;
    private String name;
    private String username;
    private String password;
    private char sex;//1=男 2=女 0=未知
    private String squad;//班级
    private char teacher;//1=为老师 2=学生
}
