package portfolio.main.dao;

import java.util.List;

import portfolio.main.entity.Project;

public interface ProjectDAO {

	
	public List<Project> getProjectList();
	
	public List<Project> getAllVisibleProjects();
	
	public void deleteProject(int id);
	
	public void updateVisible(int id);
	
	public void saveProject(Project project);
	
	public Project getProject(int id);
	
}
