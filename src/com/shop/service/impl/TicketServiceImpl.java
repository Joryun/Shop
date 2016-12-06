package com.shop.service.impl;

import com.shop.dao.TicketDao;
import com.shop.model.Product;
import com.shop.model.Ticket;
import com.shop.service.TicketService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joryun on 2016/11/30.
 */

@Transactional
@Service("ticketService")
public class TicketServiceImpl implements TicketService {

    @Resource
    private TicketDao ticketDao;


    public Integer findTicketByCid(Integer cid) {
        return ticketDao.findTicketByCid(cid);
//        return ticketDao.get(cid);
    }

}
