package com.myproject.helloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
//@RequestMapping("/hello")

public class HelloWorld { 

	@GetMapping("/")
	public String helloWorld() {
		return "<b>Hello World Version 8.1</b>";		 
	}
	
}
