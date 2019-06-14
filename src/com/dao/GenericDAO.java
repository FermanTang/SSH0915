package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * �û�
 * @author Administrator
 *
 */
public interface GenericDAO<T> {
	
	/**
	 * ����
	 * @param t
	 */
	public void save(T t);
	
	/**
	 * �޸�
	 * @param t
	 */
	public void update(T t);
	
	/**
	 * ɾ��
	 * @param t
	 */
	public void delete(T t);
	
	/**
	 * ����id��ѯ
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * ��ѯ��������
	 * @param criteria
	 * @return
	 */
	public List<T> findAll();
	
	/**
	 * ������ѯ
	 * @param criteria
	 * @return
	 */
	public List<T> findByNamedQuery(String queryName, Object...objects);//����hql��ѯ
	
	/**
	 * ������ѯ
	 * @param criteria
	 * @return
	 */
	public List<T> findByCriteria(DetachedCriteria criteria);//�������������ѯ
	
}
