package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.bean.Product;
import com.bean.Sale;
import com.bean.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ProductService;
import com.service.SaleService;
import com.service.UsersService;
import com.util.PageAssistant;

/**
 * �û�ҵ�������
 * 
 * @author Administrator
 *
 */
public class UsersAction extends ActionSupport implements SessionAware {

	/*
	 * ��ҵ��������е���ҵ���߼��ӿڶ���. ͬһ��ҵ���������, ���Ե��ö����ͬ��ҵ���߼�����
	 */
	private UsersService usersService;
	private ProductService productService;
	private SaleService saleService;
	private Map<String, Object> session;
	private List<Users> usersList;

	/** ���ڽ���ҳ����� */
	private Users users;
	private Sale sale;
	private PageAssistant<Sale> pa;
	private String chioose;

	/**
	 * ��ѯ���ۼ�¼
	 * @return
	 */
	public String queryProduct() {
		System.out.println("queryProduct");
		session.remove("chioose");
		StringBuffer hql = new StringBuffer("FROM Product");
		List<Product> productList = productService.select(hql.toString());
		session.put("productList",productList);
		return "queryProduct";
	}
	
	/**
	 * ��ѯ���ۼ�¼
	 * 
	 * @return
	 */
	public String querySale() {
		System.out.println("---> querySale");
		StringBuffer hql = new StringBuffer("FROM Sale");
		if (pa == null) {
			pa = new PageAssistant<>();
		}
		if(chioose == null || chioose.equals("")) {
			hql.append(" ORDER BY totalPrice DESC ");
		}else {
			hql.append(" ORDER BY " + chioose +" DESC ");
		}
		session.put("chioose", chioose);
		pa.setCount(saleService.count("SELECT COUNT(sId) FROM Sale"));
		pa = saleService.selectByPage(pa, hql.toString());
		System.out.println(pa);
		session.put("pa", pa);
		return "querySale";
	}

	/**
	 * �����Ʒ���ۼ�¼
	 * 
	 * @return
	 */
	public String insertSale() {
		System.out.println("---> insertSale");
		session.remove("chioose");
		session.remove("productChioose");
		String hql = "from Product where pId = ?";
		List<Product> product = productService.select(hql, sale.getProductId());
		Product pro = product.get(0);
		if (pro.getQuantity() < sale.getQuantity()) {
			session.put("insertMsg", "���ʧ��,��治��!");
			return "insertSale";
		}
		sale.setTotalPrice(sale.getPrice() * sale.getQuantity());
		sale.setSaleDate(new Date());
		saleService.insert(sale);
		//�޸���Ʒ���
		pro.setQuantity(pro.getQuantity()-sale.getQuantity());
		productService.update(pro);
		session.put("insertMsg", "��ӳɹ�!");
		return "insertSale";
	}

	/**
	 * ��¼
	 * 
	 * @return
	 */
	public String login() {
		System.out.println("---> login");
		System.out.println(users);
		String hql = "from Users where userName = ? and password = ?";
		List<Users> user = usersService.select(hql, users.getUserName(), users.getPassword());
		System.out.println("err");
		if (user.size() == 0) {
			session.put("errMsg", "�û������������!");
			return "loginErr";
		}
		hql = "from Product";
		List<Product> products = productService.select(hql);
		System.out.println(products);
		session.put("user", user.get(0));
		session.put("products", products);
		// ���������ʾ
		return "main";
	}

	/**
	 * �˳�
	 * 
	 * @return
	 */
	public String loginOff() {
		System.out.println("---> loginOff");
		session.clear();
		return "loginOff";
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public PageAssistant<Sale> getPa() {
		return pa;
	}

	public void setPa(PageAssistant<Sale> pa) {
		this.pa = pa;
	}

	public List<Users> getUsersList() {
		return usersList;
	}

	public void setUsersList(List<Users> usersList) {
		this.usersList = usersList;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public SaleService getSaleService() {
		return saleService;
	}

	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public String getChioose() {
		return chioose;
	}

	public void setChioose(String chioose) {
		this.chioose = chioose;
	}

}
