package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.dao.BaseDao;
import com.util.PageAssistant;

/**
 * 基础数据层实现类
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

	/** hibernate模板对象 */
	protected HibernateTemplate ht;

	@Override
	public void insert(T t) {
		ht.save(t);
	}

	@Override
	public void delete(T t) {
		ht.delete(t);
	}

	@Override
	public void update(T t) {
		ht.update(t);
	}

	@Override
	public List<T> select(String hql, Object... param) {
		return ht.find(hql, param);
	}

	@Override
	public int count(String hql, Object... param) {
		return Integer.parseInt(ht.find(hql, param).get(0) + "");
	}

	@Override
	public PageAssistant<T> selectByPage(PageAssistant<T> pa, final String hql, final Object... param) {
		/* 获取参数 */
		final int start = pa.getStart(); // 起始数据编号
		final int size = pa.getPageSize(); // 查询的数量

		/* 根据hql和分页的参数查询当前页的内容 */
		@SuppressWarnings("unchecked")
		List<T> items = ht.executeFind(new HibernateCallback<List<T>>() {

			@Override
			public List<T> doInHibernate(Session session) throws HibernateException, SQLException {

				// 创建query对象
				Query query = session.createQuery(hql);

				// 为占位符添加数据
				for (int i = 0; i < param.length; i++) {
					query.setParameter(i, param[i]);
				}
				// 添加分页查询条件
				query.setFirstResult(start);
				query.setMaxResults(size);
				// 查询
				List<T> list = query.list();
				return list;
			}
		});
		/* 为pa对象添加页面内容 */
		pa.setItems(items);

		return pa;
	}

	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

}
