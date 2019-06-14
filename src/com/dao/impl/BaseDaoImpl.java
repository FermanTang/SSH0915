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
 * �������ݲ�ʵ����
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

	/** hibernateģ����� */
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
		/* ��ȡ���� */
		final int start = pa.getStart(); // ��ʼ���ݱ��
		final int size = pa.getPageSize(); // ��ѯ������

		/* ����hql�ͷ�ҳ�Ĳ�����ѯ��ǰҳ������ */
		@SuppressWarnings("unchecked")
		List<T> items = ht.executeFind(new HibernateCallback<List<T>>() {

			@Override
			public List<T> doInHibernate(Session session) throws HibernateException, SQLException {

				// ����query����
				Query query = session.createQuery(hql);

				// Ϊռλ���������
				for (int i = 0; i < param.length; i++) {
					query.setParameter(i, param[i]);
				}
				// ��ӷ�ҳ��ѯ����
				query.setFirstResult(start);
				query.setMaxResults(size);
				// ��ѯ
				List<T> list = query.list();
				return list;
			}
		});
		/* Ϊpa�������ҳ������ */
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
