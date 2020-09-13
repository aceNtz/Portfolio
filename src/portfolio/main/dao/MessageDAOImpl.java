package portfolio.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import portfolio.main.entity.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Message> getAllMessages() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Message> query = session.createQuery("FROM Message ORDER BY id");
		List<Message> list = query.getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public List<Message> getSeenMessages() {
		Session session = sessionFactory.getCurrentSession();

		Query<Message> query = session.createQuery("SELECT m FROM Message m WHERE m.seen = 1 ORDER BY m.id");
		List<Message> list = query.getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public List<Message> getNotSeenMessages() {
		Session session = sessionFactory.getCurrentSession();

		Query<Message> query = session.createQuery("SELECT m FROM Message m WHERE m.seen = 0 ORDER BY m.id");
		List<Message> list = query.getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public void updateStatus(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Message message = session.get(Message.class, id);
		message.setSeen(!message.getSeen());
		
		session.update(message);
	}

	@Transactional
	@Override
	public void deleteMessage(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Message message = session.get(Message.class, id);
		
		session.delete(message);
	}

	
	@Transactional
	@Override
	public void saveMessage(Message message) {
		Session session = sessionFactory.getCurrentSession();
		
		session.save(message);
		
	}
	
	
	
}
