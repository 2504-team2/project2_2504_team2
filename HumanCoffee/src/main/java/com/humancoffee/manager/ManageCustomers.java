package com.humancoffee.manager;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.Vector;

import com.humancoffee.model.Customer;
import com.humancoffee.model.QueryInfo;

import com.humancoffee.common.*;
import com.humancoffee.dao.OraConnect;

public class ManageCustomers {
	public List<Customer>[] customers = (List<Customer>[]) new List[2];
	public byte memory_pos = 0;
	private int[] indexSearch = new int[2];
	
	public OraConnect oraConn;// = new OraConnect();
	private GenerateAlgorithm algo = new GenerateAlgorithm();
	private CtrlScanner ctrlScanner = new CtrlScanner();
	
	public class CustomerIdComparator implements Comparator<Customer>{
		@Override
		public int compare(Customer c1, Customer c2) {
			return c1.getId().compareTo(c2.getId());
		}
	}
	
	public void exit() {
		if(customers[0] != null)
			customers[0].clear();
		if(customers[1] != null)
			customers[1].clear();
	}
	
	public ManageCustomers(){
		customers[0] = new Vector<>();
		customers[1] = new Vector<>();
	}
	
	/*********************	Customer 등록, 수정, 조회, 삭제 ***********************/
	private void displayCustomer(List<Customer> list) {
		int cnt = 0;
		System.out.println("------------------------------------------------------------");
		System.out.println("*** 고객 리스트 총[" + list.size() + "]명 ***");
		System.out.println("------------------------------------------------------------");
		for(Customer customer : list) {
			cnt++;
			String status;
			if(customer.getStatus() == 0)
				status = "정상";
			else
				status = "탈퇴";
			System.out.println("번호: " + cnt + ", 현상태: " + status);
			System.out.println("ID: " + customer.getId());
			System.out.println("고객이름: " + customer.getName());
			System.out.println("전화: " + customer.getTel());
			System.out.println("포인트: " + customer.getPoint());
			System.out.println("쿠폰: " + customer.getCupon());
			System.out.println("------------------------------------------------------------");
		}
		System.out.println("============================================================");
	}
	
	public void readCustomer(byte mem_pos) {
		Object[][] obj;
		QueryInfo qi;
		String sql = "select id, pwd, name, tel, point, cupon, indate, outdate, status " +
				" from customer order by id";
		qi = new QueryInfo(sql, new Object[0]);
		obj = oraConn.exeSelect(qi);
		if(obj == null)
			return;
		String value = "";
		customers[mem_pos].clear();
		for(int row = 0; row < obj.length; row++) {
			Customer customer = new Customer();
			int col = 0;
			System.out.println();
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			customer.setId((value == null) ? "" : value);
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			customer.setPwd((value == null) ? "" : value);
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			customer.setName((value == null) ? "" : value);
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			customer.setTel((value == null) ? "" : value);
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			value = (value == null) ? "0" : value;
			customer.setPoint(Integer.parseInt(value));
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			value = (value == null) ? "0" : value;
			customer.setCupon(Integer.parseInt(value));
			
			value = Objects.toString(obj[row][col++], null);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			if(value == null || value.isEmpty())
				customer.setInDate(null);
			else
				customer.setInDate(Timestamp.valueOf(value));
//			value = (value == null) ? "" : value;
//			customer.setInDate(Timestamp.valueOf(value));
//			customer.setInDate(Date.valueOf(value));
			
			value = Objects.toString(obj[row][col++], null);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			if(value == null || value.isEmpty()) {
				System.out.println("null 입력");
				customer.setOutDate(null); 
			}else {
				System.out.println("setOutDate: " + Timestamp.valueOf(value));
				customer.setOutDate(Timestamp.valueOf(value));
			}
			value = Objects.toString(obj[row][col++]);
//			value = String.valueOf(obj[row][col++]);
			System.out.println(row + ":" + col + ":" + value);
			value = (value == null) ? "0" : value;
			customer.setStatus(Integer.parseInt(value));
			
			customers[mem_pos].add(customer);
		}
	}
	
	private void updateCustomerStatus(Customer customer) {
		indexSearch = algo.binarySearchIndex(customers[memory_pos], customer, new CustomerIdComparator());
		if(indexSearch[algo.DEF_SEARCH_RESULT_POS] != 0) {
			System.out.println(customer.getId() + ":는 없는 ID 입니다.");
			return;
		}
		String sql = "update customer set status = ? " +
				" where id = ?";

		String key = this.getClass().getName() + "|" + String.valueOf(System.currentTimeMillis());
		oraConn.queryInfos.put(key, new QueryInfo(sql, 
				customer.getStatus(), 
				customer.getId()));
		oraConn.queryInfosKey.add(key);
	}
	
	public void updateCustomer(Customer customer) {
		indexSearch = algo.binarySearchIndex(customers[memory_pos], customer, new CustomerIdComparator());
		if(indexSearch[algo.DEF_SEARCH_RESULT_POS] != 0) {
			System.out.println(customer.getId() + ":는 없는 ID 입니다.");
			return;
		}
		String sql = "update customer set pwd = ?, name = ?, tel = ?, point = ?, cupon = ?, outdate = ?, status = ? " +
				" where id = ?";
		
		String key = this.getClass().getName() + "|" + String.valueOf(System.currentTimeMillis());
		oraConn.queryInfos.put(key, new QueryInfo(sql, 
				customer.getPwd(), 
				customer.getName(), 
				customer.getTel(), 
				customer.getPoint(), 
				customer.getCupon(), 
				customer.getOutDate(), 
				customer.getStatus(), 
				customer.getId()));
		oraConn.queryInfosKey.add(key);
	}
	
	private void modCustomer(String customer_id) {
		Customer customer = new Customer();
		customer.setId(customer_id);
		customer = (Customer)algo.binarySearchObj(customers[memory_pos], customer, new CustomerIdComparator());
		if(customer == null) {
			System.out.println(customer_id + ":는 없는 ID 입니다.");
			return;
		}
		List<Customer> modCustomer = new Vector<>();
		modCustomer.add(customer);
		displayCustomer(modCustomer);
		System.out.println("------------------------------------------------------------");
		System.out.println("*** 고객 정보 수정 [" + customer_id + "] ***");
		if(customer.getStatus() == 0)
			System.out.print("메뉴선택> 1. 기본정보 수정 : 2. 회원탈퇴 : 3. 나가기");
		else
			System.out.print("메뉴선택> 1. 기본정보 수정 : 2. 회원정상 : 3. 나가기");
		int sel = ctrlScanner.getIntByScanner();
		if(sel == 0)
			sel = 1;
		if(sel == 1) {
			System.out.println("Skip 항목은 입력없이 [Enter]로 지나치시면 됩니다.");
			String customer_pwd_sha256 = "";
			System.out.print("> 비밀번호: ");
			String customer_pwd = ctrlScanner.getStrByScanner();	//scanner.nextLine();
			if(customer_pwd.isEmpty())
				customer_pwd_sha256 = customer.getPwd();
			System.out.print("> 고객 이름: ");
			String customer_name = ctrlScanner.getStrByScanner();	//scanner.nextLine();
			if(customer_name.isEmpty())
				customer_name = customer.getName();
			
			System.out.print("> 고객 전화(010-1234-5678): ");
			String customer_phone = ctrlScanner.getPhoneByScanner(null);
//			String customer_phone = ctrlScanner.getStrByScanner();	//scanner.nextLine();
			if(customer_phone.isEmpty())
				customer_phone = customer.getTel();
			
			System.out.print("> 고객 포인트: ");
			int customer_point = ctrlScanner.getIntByScanner();	//scanner.nextLine();
			if(customer_point == 0)
				customer_point = customer.getPoint();
			System.out.print("> 고객 쿠폰: ");
			int customer_cupon = ctrlScanner.getIntByScanner();	//scanner.nextLine();
			if(customer_cupon == 0)
				customer_cupon = customer.getCupon();

		}else if(sel == 2) {
			customer.setStatus((byte)(customer.getStatus() ^ 0x01));
		}else if(sel == 3)
			return;
		else {
			System.out.println("잘 못 입력하셨습니다.");
			return;
		}
		if(ctrlScanner.menuOkCancel(null)) {
			if(sel == 1)	
				updateCustomer(customer);
			else
				updateCustomerStatus(customer);
//			byte new_memory_pos = (byte)(memory_pos ^ 0x01);
//			readCustomer(new_memory_pos);
//			memory_pos = new_memory_pos;
		}
	}
	
	public void insertCustomer(Customer customer) {
		indexSearch = algo.binarySearchIndex(customers[memory_pos], customer, new CustomerIdComparator());
		if(indexSearch[algo.DEF_SEARCH_RESULT_POS] == 0) {
			System.out.println(customer.getId() + ":는 존재하는 ID 입니다.");
			return;
		}
		String sql = "insert into customer (id, pwd, name, tel, point, cupon, indate) values " +
				" (?, ?, ?, ?, ?, ?, sysdate) ";
		
		String key = this.getClass().getName() + "|" + String.valueOf(System.currentTimeMillis());
		oraConn.queryInfos.put(key, new QueryInfo(sql, 
				customer.getId(),
				customer.getPwd(), 
				customer.getName(), 
				customer.getTel(), 
				customer.getPoint(), 
				customer.getCupon()
				));
		oraConn.queryInfosKey.add(key);
	}
	
	private void addCustomer() {
		System.out.println("------------------------------------------------------------");
		System.out.println("*** 고객 등록 ***");
		System.out.print("> 고객 ID: ");
		String customer_id = ctrlScanner.getStrByScanner();	//scanner.nextLine();
		if(customer_id.isEmpty())
			return;
		System.out.print("> 비밀번호: ");
		String customer_pwd = ctrlScanner.getStrByScanner();	//scanner.nextLine();
		if(customer_pwd.isEmpty())
			return;
		System.out.print("> 고객 이름: ");
		String customer_name = ctrlScanner.getStrByScanner();	//scanner.nextLine();
		if(customer_name.isEmpty())
			return;
		System.out.print("> 고객 전화(010-1234-5678): ");
		String customer_phone = ctrlScanner.getPhoneByScanner(null);
		System.out.print("> 고객 포인트: ");
		int customer_point = ctrlScanner.getIntByScanner();	//scanner.nextLine();
		System.out.print("> 고객 쿠폰: ");
		int customer_cupon = ctrlScanner.getIntByScanner();	//scanner.nextLine();

		Customer customer = new Customer();
		customer.setId(customer_id);
		String customer_pwd_sha256 = algo.generateSha256(customer_id, customer_pwd);
		customer.setPwd(customer_pwd_sha256);
		customer.setName(customer_name);
		customer.setTel(customer_phone);
		customer.setPoint(customer_point);
		customer.setCupon(customer_cupon);
		if(ctrlScanner.menuOkCancel(null)) {
			insertCustomer(customer);
		}
	}
	
	private List<Customer> searchCustomerByName(String customer_name) {
		List<Customer> list = new Vector<>();
		int index;
		for(Customer customer : customers[memory_pos]) {
			index = customer.getName().indexOf(customer_name, 0);
			if(index >= 0)
				list.add(customer);
		}
		return list;
	}
	
	private List<Customer> searchCustomerByStatus(byte status){
		List<Customer> list = new Vector<>();
		for(Customer customer : customers[memory_pos]) {
			if(customer.getStatus() == status)
				list.add(customer);
		}
		return list;
	}
	
	private void searchManagerCustomer() {
		System.out.println("------------------------------------------------------------");
		Customer chkCustomer = new Customer();
		Customer customer = new Customer();
		List<Customer> list = new Vector<>();
//		if(mLogin.isAdminLoggedIn()) {	
			System.out.println("*** 고객 검색 ***");
			System.out.print("메뉴선택> 1. 전체 : 2. 고객 ID : 3. 고객 이름 : 4. 탈퇴 고객 : 5. 정상 고객 : 6. 나가기");
			int sel = ctrlScanner.getIntByScanner();
			if(sel == 0 || sel == 1) {
				displayCustomer(customers[memory_pos]);
			}else if(sel == 2) {
				System.out.print("> 고객 ID: ");
				String customer_id = ctrlScanner.getStrByScanner();	//scanner.nextLine();
				chkCustomer.setId(customer_id);
				customer = algo.binarySearchObj(customers[memory_pos], chkCustomer, new CustomerIdComparator());
//				Customer chkCustomer = (Customer)findItemById(customers, customer_id);
				if(customer == null) {
					System.out.println(customer_id + ":는 없는 ID 입니다.\n다시 입력 바랍니다.");
					return;
				}
				list.add(customer);
				displayCustomer(list);
			}else if(sel == 3) {
				System.out.print("> 고객 이름: ");
				String customer_name = ctrlScanner.getStrByScanner();	//scanner.nextLine();
				displayCustomer(searchCustomerByName(customer_name));
			}else if(sel == 4 || sel == 5){
				byte status = 0;
				if(sel == 4)
					status = 1;
				displayCustomer(searchCustomerByStatus(status));
			}else if(sel == 6)
				return;
			else
				System.out.println("잘 못 입력하셨습니다.\n다시 입력바랍니다.");
/*		}else {	//	고객 내 정보 보기
			chkCustomer.setCustomer_id(mLogin.currentUser);
			customer = (Customer)algo.binarySearchObj(customers[memory_pos], chkCustomer, new CustomerIdComparator());
//			Customer customer = (Customer)findItemById(customers, this.currentUser);
			if(customer == null) {
				System.out.println(mLogin.currentUser + ":는 없는 ID 입니다.\n다시 입력 바랍니다.");
				return;
			}
			list.add(customer);
			displayCustomer(list);
		}*/
	}
	
	public void manageCustomers() {
		int sel;
		String customer_id = "";
		System.out.println("------------------------------------------------------------");
		System.out.println("*** 고객 관리 메뉴 ***");
/*		if(mLogin.isAdminLoggedIn()) {			//	관리자 로그인 상태
			if(customers[memory_pos].isEmpty()) {
				System.out.print("메뉴선택> 1. 회원가입 : 2. 나가기");
				sel = ctrlScanner.getIntByScanner();
				if(sel == 0)
					sel = 1;
				if(sel < 1 || sel > 2)
					sel = 0;
				if(sel == 1) {
					sel = 2;
				}else if(sel == 4) {
					sel = 5;
				}
			}else {*/
				System.out.print("메뉴선택> 1. 검색 : 2. 회원가입 : 3. 수정 : 4. 나가기");
				sel = ctrlScanner.getIntByScanner();
				if(sel == 0)
					sel = 1;
				if(sel < 1 || sel > 5)
					sel = 0;
				if(sel == 3) {
					System.out.print("수정할 고객의 ID: ");
					customer_id = ctrlScanner.getStrByScanner();	//scanner.nextLine();
				}else if(sel == 4) {
					System.out.print("삭제할 고객의 ID: ");
					customer_id = ctrlScanner.getStrByScanner();	//scanner.nextLine();
				}
/*			}
		}else if(mLogin.isCustomerLoggedIn()) {	//	고객 로그인 상태
			System.out.print("메뉴선택> 1. 내 정보 보기 : 2. 수정 : 3. 나가기");
			sel = ctrlScanner.getIntByScanner();
			if(sel == 0)
				sel = 1;
			if(sel < 1 || sel > 3)
				sel = 0;
			else {
				if(sel == 2)
					sel = 3;
				else if(sel == 3)
					sel = 5;
				customer_id = mLogin.currentUser;
			}
		}else {							//	신규 가입
			System.out.print("메뉴선택> 1. 회원가입 : 2. 나가기");
			sel = ctrlScanner.getIntByScanner();
			if(sel == 0)
				sel = 1;
			if(sel < 1 || sel > 2)
				sel = 0;
			else {
				if(sel == 1)
					sel = 2;
				else
					sel = 5;
			}
		}*/
		
		switch(sel){
			case 0 -> {
				System.out.println("잘 못 입력하셨습니다.");
			}
			case 1 -> searchManagerCustomer();
			case 2 -> addCustomer();
			case 3 -> modCustomer(customer_id);
			case 4 -> {
				return;
			}
		}
		manageCustomers();
	}
}
