package portfolio.main.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import portfolio.main.entity.User;

@Repository
public class userDAOImpl implements userDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	@Transactional
	@Override
	public User getUserInfo() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<User> query = session.createQuery("FROM User");
		User user = query.getSingleResult();
		
		return user;
	}


	@Transactional
	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		
		session.update(user);
	}
	
	
	
	
}
