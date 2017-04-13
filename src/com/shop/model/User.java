package com.shop.model;

import org.hibernate.validator.constraints.Email;

import javax.persistence.*;

@Table(name = "user")
@Entity
public class User {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private Integer uid;
    private String username;
    private String password;
    private String name;
    @Email(message = "邮箱格式错误")
    private String email;
    private String phone;
    private Integer age;
    private String addr;
    private Integer state;
    private String code;
    // 电子卷包:外键
    @OneToOne(cascade = {CascadeType.REFRESH}, fetch = FetchType.EAGER, mappedBy = "user")
    private Wallet wallet;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Wallet getWallet() {
        return wallet;
    }

    public void setWallet(Wallet wallet) {
        this.wallet = wallet;
    }

    @Override
    public String toString() {
        return "User [uid=" + uid + ", username=" + username + ", password="
                + password + ", name=" + name + ", email=" + email + ", phone="
                + phone + ", addr=" + addr + ", state=" + state + ", code="
                + code + "]";
    }
}
