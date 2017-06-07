package com.shop.dao.impl;

import com.shop.dao.ProductDao;
import com.shop.model.CategorySecond;
import com.shop.model.Product;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Repository("productDao")
@SuppressWarnings("all")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao {

    final String selecthql = "select p.pid,p.image,p.is_hot,"
            + "p.market_price,p.pdate,p.pdesc,p.pname,p.shop_price ";

    public Integer CountPageProductFromCategory(Integer cid) {
        String hql = "select count(*) from Product p, Category c, CategorySecond cs ";
        hql += "where p.categorySecond.csid = cs.csid and cs.category.cid = c.cid and c.cid = ?";
        return count(hql, cid);
    }

    public Integer CountPageProductFromCategorySecond(Integer csid) {
        String hql = "select count(*) from Product p ,CategorySecond cs ";
        hql += "where p.categorySecond.csid = cs.csid and cs.csid = ?";
        return count(hql, csid);
    }

    public Integer CountProduct() {
        String hql = "select count(*) from Product";
        return count(hql);
    }

    public List<Product> findByCategorySecondCategoryCid(Integer cid,
                                                         Integer page) {
        String hql = selecthql + "from Product p,Category c, CategorySecond cs ";
        hql += "where p.categorySecond.csid = cs.csid and cs.category.cid = c.cid and c.cid = ?";
        return Query(cid, page, hql);
    }

    public List<Product> findByCategorySecondCsid(Integer csid, Integer page) {
        String hql = selecthql + "from Product p ,CategorySecond cs ";
        hql += "where p.categorySecond.csid = cs.csid and cs.csid = ?";
        return Query(csid, page, hql);
    }

    private List<Product> Query(Integer csid, Integer page, String hql) {

        int rows = 12;
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, csid);
        List list = query.setFirstResult((page - 1) * rows).setMaxResults(rows).list();

        List<Product> products = new ArrayList<Product>();
        Iterator iter = list.iterator();

        while (iter.hasNext()) {

            Object[] obj = (Object[]) iter.next();
            Product product = new Product();

            int pid = (Integer) obj[0];
            product.setPid(pid);
            product.setImage((String) obj[1]);
            product.setIs_hot((Integer) obj[2]);
            product.setMarket_price((Float) obj[3]);
            product.setPdate((Date) obj[4]);
            product.setPdesc((String) obj[5]);
            product.setPname((String) obj[6]);
            product.setShop_price((Float) obj[7]);

            products.add(product);
        }
        return products;
    }

    public List<Product> findHot() {
        String hql = "from Product p where p.is_hot = 1 ";
        hql += "order by p.pdate desc";
        int rows = 10;
        return find(hql, 1, rows);
    }

    public Product findOne(Integer pid) {
        String hql = "from Product p where p.pid = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, pid);
        return (Product) query.uniqueResult();
    }

    public CategorySecond findOneSecond(Integer csid) {
        String hql = "from CategorySecond p where p.scid = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, csid);
        return (CategorySecond) query.uniqueResult();
    }

    public List<Product> findNew() {
        String hql = "from Product p ";
        hql += "order by p.pdate desc";
        int rows = 10;
        return find(hql, 1, rows);
    }

    public List<Product> findAll(Integer page) {
        String hql = "from Product";
        int rows = 12;
        int page1 = page;
        return find(hql, page1, rows);
    }

}
