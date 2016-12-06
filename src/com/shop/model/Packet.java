package com.shop.model;



import javax.persistence.*;

/**
 * Created by Joryun on 2016/11/30.
 *
 * 用户卡包的实体对象
 */

@Table(name = "packet")
@Entity
public class Packet {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private Integer pacid;
    private Integer uid;

    //外键
    @OneToOne(optional=false)
    @JoinColumn(name="uid", unique=true, nullable=false, updatable=false,insertable=false)
    private	User user;

    public Integer getPacid() {
        return pacid;
    }

    public void setPacid(Integer pacid) {
        this.pacid = pacid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Packet{" +
                "pacid=" + pacid +
                ", user=" + user +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
