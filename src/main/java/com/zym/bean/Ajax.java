package com.zym.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
* @program: Ajax
* @description: AJAX类
* @author: Mr.Zou
* @create: 2021-11-23 15:47
*/
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Ajax {
    private boolean success;
    private Object data;
}
