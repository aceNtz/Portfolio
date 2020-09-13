package portfolio.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import portfolio.main.entity.Project;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SessionFactory sessionFactory;

	
	@Transactional
	@Override
	public List<Project> getProjectList() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Project> query = session.createQuery("SELECT p FROM Project p ORDER BY p.important DESC");
		List<Project> list = query.getResultList();
		
		return list;
	}


	@Transactional
	@Override
	public void deleteProject(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Project project = session.get(Project.class, id);
		session.delete(project);
		
	}

	@Transactional
	@Override
	public void updateVisible(int id) {
		Session session = sessionFactory.getCurrentSession();

		Project project = session.get(Project.class, id);
		project.setVisible(!project.getVisible());
		
		session.update(project);
		
	}


	@Transactional
	@Override
	public void saveProject(Project project) {
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(project);
		
	}


	@Transactional
	@Override
	public Project getProject(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		Project project = session.get(Project.class, id);
		
		return project;
	}


	@Transactional
	@Override
	public List<Project> getAllVisibleProjects() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Project> query = session.createQuery("SELECT p FROM Project p WHERE p.visible = 1 ORDER BY p.important DESC");
		List<Project> list = query.getResultList();
		
		return list;
	}
	
	
	
	
}
