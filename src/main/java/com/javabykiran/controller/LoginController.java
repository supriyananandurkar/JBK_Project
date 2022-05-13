package com.javabykiran.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javabykiran.entity.User;
import com.javabykiran.entity.Users;

@Controller
public class LoginController {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("showRegisterPage")
	public String showLoginPage()
	{
		return "register";
	}
	
	@RequestMapping("login")
	public ModelAndView login(User user,HttpServletRequest request)
	{

		Session session = factory.openSession();
		
		Users users = session.load(Users.class,user.getUsername());
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(user.getUsername().equals("admin") && user.getPassword().equals("admin123"))
		{
			modelAndView.setViewName("questionsmanagement");
			
		}
		
		else if(users.getPassword().equals(user.getPassword()))
		{
			modelAndView.setViewName("questions");
			modelAndView.addObject("message","welcome " + user.getUsername());
		}
		
		else
		{
			modelAndView.setViewName("login");
			modelAndView.addObject("errorMessage","wrong password");
		}
		
		HttpSession ses= request.getSession();
		ses.setAttribute("username",user.getUsername());
		
		return modelAndView;
		
		
	}

}
