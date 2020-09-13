package portfolio.main.entity;

import javax.validation.constraints.Size;

public class ChangePassword {

	
	private String oldPassword;
	
	@Size(min = 6, max = 68, message = "Minimun number of characters is 6 and maximum is 68.")
	private String newPassword;
	
	private String confirmPassword;
	
	
	
	
	
	
	
	public ChangePassword() {
		
	}
	
	
	public ChangePassword(String oldPassword, String newPassword, String confirmPassword) {
		super();
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
		this.confirmPassword = confirmPassword;
	}


	
	
	
	
	
	public String getOldPassword() {
		return oldPassword;
	}


	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}


	public String getNewPassword() {
		return newPassword;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}


	public String getConfirmPassword() {
		return confirmPassword;
	}


	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
