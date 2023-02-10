package kr.ranian.bootBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HelloController {
	
	@GetMapping("/hello")
	public @ResponseBody String hello() {
		return "Hello Spring Boot";
	}
	
	@GetMapping("/")
	public String home() {
		return "index";
	}

}
