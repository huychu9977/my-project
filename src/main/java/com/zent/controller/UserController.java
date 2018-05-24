package com.zent.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zent.dao.IUserDAO;
import com.zent.dao.UserDAO;
import com.zent.entity.User;
import com.zent.entity.UserJson;
import com.zent.service.IUserService;

@Controller
public class UserController {

	@Autowired
	IUserService userService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String index1(Model model) {
		model.addAttribute("user", new User());
		// userService.getAll();
		return "user-manager";
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String show(Model model, HttpSession session, HttpServletRequest request) {

		// if (session.getAttribute("un") != null) {
		// trang người dùng ấn
		Integer pageNumber = 0;
		if (request.getParameter("iDisplayStart") != null)
			pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / 10);

		String txtSearch = request.getParameter("sSearch");
		// số lượng hiển thị
		Integer pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
		// Constants.PAGE_SIZE = pageDisplayLength;

		User user = new User();
		user.setName(txtSearch);

		ArrayList<User> mData = userService.search(user, pageNumber, 1);

		// model.addAttribute("username", session.getAttribute("un"));
		// model.addAttribute("user", new UserManager());
		UserJson uj = new UserJson();
		uj.setiTotalRecords(userService.search(user, pageNumber, 0).size());
		uj.setiTotalDisplayRecords(userService.search(user, pageNumber, 0).size());
		uj.setAaData(mData);

		ObjectMapper mapper = new ObjectMapper();
		try {
			// System.out.println(mapper.writeValueAsString(uj));
			return mapper.writeValueAsString(uj);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * } else { return "redirect:home"; }
		 */
		return null;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add1(Model model) {
		model.addAttribute("user", new User());
		return "user-add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("user") @Validated User user, BindingResult rs) {
		if (rs.hasErrors()) {
			return "user-add";
		} else {
			userService.insert(user);
			return "redirect:user";
		}

	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model) {
		model.addAttribute("user", new User());
		return "user-add";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody String edit(@ModelAttribute("user") User user) {
		userService.update(user);
		try {
			ObjectMapper mapper = new ObjectMapper();
			return mapper.writeValueAsString(new Boolean(true));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam("id") Integer id, Model model) {
		User user = new User();
		user.setId(id);
		userService.delete(user);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(new Boolean(true));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
