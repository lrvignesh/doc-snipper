package com.doc.snip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/docSnipper")
public class HomeController {
	
	@RequestMapping("/home")
	public String home() {
		return "/home.jsp";
	}	
}
