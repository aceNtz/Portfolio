package portfolio.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import portfolio.main.dao.userDAO;

@Controller
public class AuthContoller {

	@Autowired
	private userDAO userDAO;

	@RequestMapping("/login")
	public String getLoginPage(Model model) {
		model.addAttribute("userInfo", userDAO.getUserInfo());
		
		return "login-page";
	}
	
}
