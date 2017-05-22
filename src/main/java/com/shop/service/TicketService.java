package com.shop.service;

import com.shop.model.Product;
import com.shop.model.Ticket;

import java.util.List;

/**
 * Created by Joryun on 2016/11/30.
 */
public interface TicketService {

    //根据cid获取ticket对象
    public Integer findTicketByCid(Integer cid);

}
