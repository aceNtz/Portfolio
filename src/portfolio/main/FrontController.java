package portfolio.main;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import portfolio.main.dao.MessageDAO;
import portfolio.main.dao.ProjectDAO;
import portfolio.main.dao.userDAO;
import portfolio.main.entity.Message;
import portfolio.main.entity.User;

@Controller
@RequestMapping("/")
public class FrontController {

	@Autowired
	private userDAO userDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private MessageDAO messageDAO;
	
	
	
	
	@RequestMapping({"/", "/index"})
	public String getIndexPage(Model model) {
		User user = userDAO.getUserInfo();
		
		user.setVisitCounter(user.getVisitCounter() + 1);
		userDAO.updateUser(user);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
		LocalDate dateBorn = LocalDate.parse(user.getDateBorn(), formatter);
		
		user.setAge(Period.between(dateBorn, LocalDate.now()).getYears());
		model.addAttribute("userInfo", user);
		model.addAttribute("projectList", projectDAO.getAllVisibleProjects());
		model.addAttribute("message", new Message());
		
		return "front/index-page";
	}
	
	
	@RequestMapping("/message-save")
	public String saveMessage(Model model,@Valid @ModelAttribute Message message, BindingResult result) {
		if(result.hasErrors()) {
			return "redirect:/index";
		}
		
		message.setDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy - HH:mm")));
		message.setSeen(false);
		
		messageDAO.saveMessage(message);
		
		return "redirect:/index";
	}
	
	
	
	
	
}
