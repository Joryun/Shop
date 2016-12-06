package com.shop.dao;

import com.shop.model.Ticket;

import java.util.List;

/**
 * Created by Joryun on 2016/11/30.
 */
public interface TicketDao extends BaseDao<Ticket> {

    public Integer findTicketByCid(Integer cid);
}
