package com.shop.dao;

import com.shop.model.Order;
import com.shop.model.Packet;

/**
 * Created by Joryun on 2016/11/30.
 */
public interface PacketDao extends BaseDao<Packet> {

    //根据uid查询packet对象
    public Integer findByUid(Integer uid);
}
