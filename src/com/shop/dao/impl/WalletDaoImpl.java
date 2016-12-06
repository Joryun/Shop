package com.shop.dao.impl;

import org.springframework.stereotype.Repository;

import com.shop.dao.WalletDao;
import com.shop.model.Wallet;


@Repository("walletDao")
@SuppressWarnings("all")
public class WalletDaoImpl extends BaseDaoImpl<Wallet> implements WalletDao{

}
