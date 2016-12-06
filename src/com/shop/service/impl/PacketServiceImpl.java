package com.shop.service.impl;

import com.shop.dao.PacketDao;
import com.shop.model.Packet;
import com.shop.service.PacketService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by Joryun on 2016/11/30.
 */

@Transactional
@Service("packetService")
public class PacketServiceImpl implements PacketService {

    @Resource
    private PacketDao packetDao;

    public Integer findPacketByUid(Integer uid) {
        return packetDao.findByUid(uid);
    }
}
