package services;

import java.util.List;

import org.hibernate.Session;

import utilites.HibernateUtil;

public class AdminServices {
	public static boolean isAdmin(String uname, String pass) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<?> q = session.createQuery("SELECT id FROM Admin WHERE username='"+uname+"' and password='"+pass+"'").list();
		if(0==q.size()) {
			return false;
		}
		return true;
	}
}
