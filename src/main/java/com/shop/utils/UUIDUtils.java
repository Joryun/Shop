package com.shop.utils;

import java.util.UUID;

/**
 * 生成随机字符串的工具类
 */

public class UUIDUtils {
    /**
     * 获得随机的字符串
     *
     * @return
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
