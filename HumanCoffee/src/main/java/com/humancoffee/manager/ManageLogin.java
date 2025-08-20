package com.humancoffee.manager;

import com.humancoffee.common.*;
import com.humancoffee.model.Customer;
import com.humancoffee.model.Com_Member;
//import model.Seller;

public class ManageLogin {
	private CtrlScanner ctrlScanner = new CtrlScanner();
	private GenerateAlgorithm algo = new GenerateAlgorithm();
	
	public ManageCustomers mCustomers;// = new ManageCustomers();
	public ManageComMembers mComMembers;// = new ManageSellers();
	public String currentUser;
	
	private byte	divCurrentUser;		//	1 : admin, 2 : seller, 4 : customer
	private int		userRoll;
	private final static byte DIV_ADMIN = 1;
	private final static byte DIV_MEMBER = 2;
	private final static byte DIV_CUSTOMER = 4;
	
	public final String ADMIN_ID = "admin";
	private final static String ADMIN_PWD = "password";
	
	/*********************	LogIn Out ***********************/
	public boolean login(String id, String password) {
		if((id.equals(ADMIN_ID)) && password.equals(ADMIN_PWD)) {
			this.currentUser = id;
			this.divCurrentUser = DIV_ADMIN;
			this.userRoll = 0;
			return true;
		}
		String password_sha256 = algo.generateSha256(id, password);
		for(Customer customer : mCustomers.customers[mCustomers.memory_pos]) {
//			if(customer.getCustomer_id().equals(id) && customer.getCustomer_pwd().equals(password)) {
			if(customer.getId().equals(id) && customer.getPwd().equals(password_sha256)) {
				this.currentUser = id;
				this.divCurrentUser = DIV_CUSTOMER;
				this.userRoll = 0;
				return true;
			}
		}
		for(Com_Member com_member : mComMembers.com_members[mComMembers.memory_pos]) {
			if(com_member.getId().equals(id) && com_member.getPwd().equals(password_sha256)) {
				this.currentUser = id;
				this.divCurrentUser = DIV_MEMBER;
				this.userRoll = com_member.getRoll();
				return true;
			}
		}
		return false;
		
	}
	
	public void logout() {
		this.currentUser = null;
		this.divCurrentUser = 0;
	}
		
	public boolean isAdminLoggedIn() {
		if((divCurrentUser & DIV_ADMIN) == DIV_ADMIN)
			return true;
		return false;
	}
	public boolean isMemberLoggedIn() {
		if((divCurrentUser & DIV_MEMBER) == DIV_MEMBER)
			return true;
		return false;
	}
	public boolean isCustomerLoggedIn() {
		if((divCurrentUser & DIV_CUSTOMER) == DIV_CUSTOMER)
			return true;
		return false;
	}
	public int getRoll() {
		return this.userRoll;
	}
}
