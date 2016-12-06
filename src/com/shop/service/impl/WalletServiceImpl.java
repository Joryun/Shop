package com.shop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.OrderDao;
import com.shop.dao.WalletDao;
import com.shop.model.Wallet;
import com.shop.service.WalletService;
@Transactional
@Service("walletService")
public class WalletServiceImpl implements WalletService{
	@Resource
	private WalletDao walletDao;
	//修改电子钱包的值
	public void update(Wallet wallet) {
		walletDao.update(wallet);
	}

}
