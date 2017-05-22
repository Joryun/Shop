package com.shop.dao.impl;

import com.shop.dao.OrderDao;
import com.shop.model.Order;
import com.shop.model.OrderItem;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("orderDao")
@SuppressWarnings("all")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {

    public Order findByOid(Integer oid) {
        String hql = "from Order o where o.oid = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, oid);
        return (Order) query.uniqueResult();
    }

    public List<Order> findByPage(int begin, int limit) {
        String hql = "from Order order by ordertime desc";
        Query query = this.getCurrentSession().createQuery(hql);
        return query.setFirstResult((begin - 1) * limit).setMaxResults(limit).list();

    }

    public int findCount() {
        String hql = "select count(*) from Order";
        Query query = this.getCurrentSession().createQuery(hql);
        List<Long> list = query.list();
        if (list != null && list.size() > 0) {
            Integer count = list.get(0).intValue();
            return (count % 10 == 0 ? (count / 10) : (count / 10 + 1));
        }
        return 0;
    }

    public int findCountByUid(Integer uid) {
        String hql = "select count(*) from Order o where o.user.uid = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, uid);
        List<Long> list = query.list();
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    public List<OrderItem> findOrderItem(Integer oid) {
        String hql = "from OrderItem oi where oi.order.oid = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, oid);
        List<OrderItem> list = query.list();
        if (list != null && list.size() > 0) {
            return list;
        }
        return null;
    }

    public List<Order> findPageByUid(Integer uid, int begin, int limit) {
        String hql = "from Order o where o.user.uid = ? order by o.ordertime desc";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, uid);
        List<Order> list = query.setFirstResult((begin - 1) * limit).setMaxResults(limit).list();
        if (list != null && list.size() > 0) {
            return list;
        }
        return null;
    }
}
