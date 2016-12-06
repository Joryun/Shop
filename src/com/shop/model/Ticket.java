package com.shop.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Joryun on 2016/11/30.
 */

@Table(name = "ticket")
@Entity
public class Ticket {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private Integer tid;
    private Double privilege;
    private Double consume;
    private Date useTime;

    /*@OneToOne
    @JoinColumn(name="cid")
    private Category category;*/

    // 用户的:外键
    @OneToOne(optional=false)
    @JoinColumn(name="cid", unique=true, nullable=false, updatable=false,insertable=false)
    private	Category category;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Double getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Double privilege) {
        this.privilege = privilege;
    }

    public Double getConsume() {
        return consume;
    }

    public void setConsume(Double consume) {
        this.consume = consume;
    }

    public Date getUseTime() {
        return useTime;
    }

    public void setUseTime(Date useTime) {
        this.useTime = useTime;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "tid=" + tid +
                ", privilege=" + privilege +
                ", consume=" + consume +
                ", useTime=" + useTime +
                ", category=" + category +
                '}';
    }
}
