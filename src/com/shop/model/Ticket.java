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
    private Float privilege;
    private Float consume;
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

    public Float getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Float privilege) {
        this.privilege = privilege;
    }

    public Float getConsume() {
        return consume;
    }

    public void setConsume(Float consume) {
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
