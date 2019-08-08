package com.cafe24.shoppingmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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

	@ResponseBody
	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public JSONResult login(
			@ModelAttribute @Valid UserVo userVo,
			BindingResult result,
			HttpSession session) {
		
		if( result.hasErrors() ) {
			List<ObjectError> list = result.getAllErrors();
			for(ObjectError error : list) {
				return JSONResult.fail("아이디와 비밀번호를 확인하세요");
			}
		}
		
		UserVo authUser = userService.login(userVo);
		if(authUser == null) {
			JSONResult.fail("아이디와 비밀번호를 확인하세요");
		}
		session.setAttribute("authUser", authUser);
		session.setMaxInactiveInterval(60*60);
		
		return JSONResult.success(true);
	}
	
	@RequestMapping(value= "/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/";
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
