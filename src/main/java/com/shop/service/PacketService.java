package com.shop.service;

import com.shop.model.Packet;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Joryun on 2016/11/30.
 */

public interface PacketService {

    //根据uid获取packet对象
    public Integer findPacketByUid(Integer uid);
}
