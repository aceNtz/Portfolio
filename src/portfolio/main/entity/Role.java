package portfolio.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {

	@Id
	@Column
	private String authority;
	
	
	
	
	public Role() {
		
	}

	
	

	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
	
	
	
	
}
