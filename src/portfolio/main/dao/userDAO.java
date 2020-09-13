package portfolio.main.dao;

import portfolio.main.entity.User;

public interface userDAO {

	public User getUserInfo();
	
	public void updateUser(User user);
	
}
