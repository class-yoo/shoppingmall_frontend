package com.cafe24.shoppingmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.service.UserService;
import com.cafe24.shoppingmall.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	
	
	@RequestMapping(value= "/join", method=RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value= "/join", method=RequestMethod.POST)
	public JSONResult join(@ModelAttribute UserVo userVo) {
		return userService.join(userVo);
	}
	
	@ResponseBody
	@RequestMapping(value= "/checkId", method=RequestMethod.GET)
	public JSONResult checkOverlapId(@RequestParam String checkId) {
		
		return userService.checkOverlapId(checkId);
	}
	
	
	
}
