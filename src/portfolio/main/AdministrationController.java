package portfolio.main;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portfolio.main.entity.ChangePassword;
import portfolio.main.dao.MessageDAO;
import portfolio.main.dao.ProjectDAO;
import portfolio.main.dao.userDAO;
import portfolio.main.entity.Project;
import portfolio.main.entity.User;

@Controller
@RequestMapping("/administration")
public class AdministrationController {

	@Autowired
	private userDAO userDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private MessageDAO messageDAO;
	
	
	@RequestMapping("/user-info")
	public String getUserInfo(Model model) {
		User user = userDAO.getUserInfo();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
		LocalDate dateBorn = LocalDate.parse(user.getDateBorn(), formatter);
		
		
		user.setAge(Period.between(dateBorn, LocalDate.now()).getYears());
		
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		model.addAttribute("userInfo", user);
		
		return "user-info-page";
	}
	
	
	@RequestMapping("user-update")
	public String updateUser(Model model) {
		model.addAttribute("userInfo", userDAO.getUserInfo());
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		
		return "user-edit-page";
	}
	
	
	@RequestMapping("/user-update-info")
	public String updateUserInfo(Model model, @ModelAttribute User user) {
		userDAO.updateUser(user);
		
		return "redirect:/administration/user-info";
	}
	
	

	@RequestMapping("/user-password-change")
	public String changeUserPassword(Model model) {
		model.addAttribute("changePassword", new ChangePassword());
		model.addAttribute("userInfo", userDAO.getUserInfo());
		
		return "user-password-change-page";
	}
	
	
	@RequestMapping("/user-password-change-action")
	public String changeUserPasswordAction(@Valid @ModelAttribute ChangePassword changePassword, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("userInfo", userDAO.getUserInfo());
			return "user-password-change-page";
		}
		if(changePassword.getNewPassword().equals(changePassword.getConfirmPassword())) {
			User user = userDAO.getUserInfo();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			if(encoder.matches(changePassword.getOldPassword(), user.getPassword().replace("{bcrypt}", ""))) {
				user.setPassword("{bcrypt}" + encoder.encode(changePassword.getNewPassword()));
				userDAO.updateUser(user);
			}
			// Not correct old password
			else {
				model.addAttribute("changePassword", new ChangePassword());
				model.addAttribute("userInfo", userDAO.getUserInfo());
				model.addAttribute("passwordError", new String("The old password you have entered is incorrect!"));
				
				return "user-password-change-page";
			}
		}
		// New password does not match confirm password
		else {
			model.addAttribute("changePassword", new ChangePassword());
			model.addAttribute("userInfo", userDAO.getUserInfo());
			model.addAttribute("passwordError", new String("New password does't match the confirm password!"));
			
			return "user-password-change-page";
		}
		
		return "redirect:/administration/user-info";
	}
	
	
	/////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/project-list")
	public String getProjectList(Model model) {
		model.addAttribute("userInfo", userDAO.getUserInfo());
		model.addAttribute("projectList", projectDAO.getProjectList());
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		
		return "project-list-page";
	}
	
	
	@RequestMapping("/project-delete")
	public String deleteProject(Model model, @RequestParam int id) {
		projectDAO.deleteProject(id);
		
		return "redirect:/administration/project-list";
	}
	
	
	@RequestMapping("/project-status-update")
	public String updateVisible(Model model, @RequestParam int id) {
		projectDAO.updateVisible(id);
		
		return "redirect:/administration/project-list";
	}
	
	
	@RequestMapping("/project-update")
	public String updateProject(Model model, @RequestParam int id) {
		model.addAttribute("project", projectDAO.getProject(id));
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		
		return "project-form-page";
	}
	
	
	
	@RequestMapping("/project-add")
	public String createProject(Model model) {
		model.addAttribute("userInfo", userDAO.getUserInfo());
		model.addAttribute("project", new Project());
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		
		return "project-form-page";
	}
	
	
	@RequestMapping("/project-save")
	public String saveProject(Model model, @ModelAttribute Project project) {
		if(project.getDateAdded() == null || project.getDateAdded() == "") {
			project.setDateAdded(LocalDate.now().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG)));
			project.setVisible(true);
		}
		
		projectDAO.saveProject(project);
	
		
		return "redirect:/administration/project-list";
	}
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/message-list")
	public String getMessageList(Model model, @RequestParam int pageId) {
		if(pageId == 0) {
			model.addAttribute("messageList", messageDAO.getNotSeenMessages());
		}
		else if(pageId == 1) {
			model.addAttribute("messageList", messageDAO.getSeenMessages());
		}
		else {
			model.addAttribute("messageList", messageDAO.getAllMessages());
		}
		
		model.addAttribute("unreadCounter", messageDAO.getNotSeenMessages().size());
		
		return "message-list-page";
	}
	
	
	@RequestMapping("/message-seen-update")
	public String changeMessageStatus(Model model, @RequestParam int id) {
		messageDAO.updateStatus(id);
		
		return "redirect:/administration/message-list?pageId=-1";
	}
	
	
	@RequestMapping("/message-delete")
	public String deleteMessage(Model model, @RequestParam int id) {
		messageDAO.deleteMessage(id);
		
		return "redirect:/administration/message-list?pageId=-1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
