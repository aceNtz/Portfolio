package portfolio.main.entity;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users")
public class User {
	
	@Transient
	private static User instance;
	
	@Transient
	private int age;
	
	@Id
	@Column
	private String username;
	
	@Column
	private String password;
	
	@Column
	private String name;
	
	@Column
	private String surname;
	
	@Column
	private String image;
	
	@Column
	private String phone;
	
	@Column
	private String linkedIn;
	
	@Column
	private String git;
	
	@Column
	private String shortDescription;
	
	@Column
	private String longDescription;
	
	@Column
	private String CVEnglish;
	
	@Column
	private String CVSerbian;
	
	@Column
	private String residence;
	
	@Column
	private String dateBorn;
	
	@Column
	private boolean enabled;
	
	@Column
	private int visitCounter;
	
	@JoinTable(name = "authorities", joinColumns = @JoinColumn(name = "username"), inverseJoinColumns = @JoinColumn(name = "authority"))
	@ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	private List<Role> authorities;
	
	
	
	private User() {
		
	}






	

	public String getUsername() {
		return username;
	}

		
	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getSurname() {
		return surname;
	}




	public void setSurname(String surname) {
		this.surname = surname;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getLinkedIn() {
		return linkedIn;
	}




	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}




	public String getGit() {
		return git;
	}




	public void setGit(String git) {
		this.git = git;
	}




	public String getShortDescription() {
		return shortDescription;
	}




	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}




	public String getLongDescription() {
		return longDescription;
	}




	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}


	
	public String getCVEnglish() {
		return CVEnglish;
	}




	public void setCVEnglish(String cVEnglish) {
		CVEnglish = cVEnglish;
	}
	
	


	public String getCVSerbian() {
		return CVSerbian;
	}




	public void setCVSerbian(String cVSerbian) {
		CVSerbian = cVSerbian;
	}
	
	
	
	
	
	
	
	public int getVisitCounter() {
		return visitCounter;
	}








	public void setVisitCounter(int visitCounter) {
		this.visitCounter = visitCounter;
	}








	public List<Role> getAuthorities() {
		return authorities;
	}








	public void setAuthorities(List<Role> authorities) {
		this.authorities = authorities;
	}

    

	public boolean getEnabled() {
		return enabled;
	}








	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	
	








	public String getResidence() {
		return residence;
	}








	public void setResidence(String residence) {
		this.residence = residence;
	}








	public String getDateBorn() {
		return dateBorn;
	}








	public void setDateBorn(String dateBorn) {
		this.dateBorn = dateBorn;
	}





	
	
	public int getAge() {
		return age;
	}








	public void setAge(int age) {
		this.age = age;
	}








	// Metoda za pozivanje instance
	public static User getUserInfo() {
		if(instance == null) {
			return new User();
		}
		
		return instance;
		
	}
	
	
	
	
	
	
	
	
	
	
}
