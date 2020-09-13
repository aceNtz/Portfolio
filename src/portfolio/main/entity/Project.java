package portfolio.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Project {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String name;
	
	@Column
	private String image;
	
	@Column
	private String description;
	
	@Column
	private String dateAdded;
	
	@Column
	private String link;
	
	@Column
	private boolean visible;
	
	@Column
	private boolean important;
	
	
	
	
    public Project() {
    	
	}



    
    
    
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getDateAdded() {
		return dateAdded;
	}



	public void setDateAdded(String dateAdded) {
		this.dateAdded = dateAdded;
	}



	public String getLink() {
		return link;
	}



	public void setLink(String link) {
		this.link = link;
	}



	public boolean getVisible() {
		return visible;
	}



	public void setVisible(boolean visible) {
		this.visible = visible;
	}






	public boolean isImportant() {
		return important;
	}






	public void setImportant(boolean important) {
		this.important = important;
	}
    
    
    
	
	
	
	
    
    
    
    
	
	
	
	
}
