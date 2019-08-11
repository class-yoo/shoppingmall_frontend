package com.cafe24.shoppingmall.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.shoppingmall.dto.JSONResult;
import com.cafe24.shoppingmall.service.AdminService;
import com.cafe24.shoppingmall.service.UserService;
import com.cafe24.shoppingmall.vo.UserVo;

@Controller
@RequestMapping("admin/user/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	public String login(HttpSession session) {
		
		if(session.getAttribute("authAdmin")!=null) {
			return "admin/product/list";
		}
		return "admin/user/login";
	}

	@ResponseBody
	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public JSONResult login(
			@ModelAttribute @Valid UserVo userVo,
			BindingResult result,
			HttpSession session) {
		
		if( result.hasErrors() ) {
			List<ObjectError> list = result.getAllErrors();
			return JSONResult.fail("아이디와 비밀번호를 확인하세요");
		}
		
		UserVo authAdmin = adminService.login(userVo);
		if(authAdmin == null) {
			return JSONResult.fail("아이디와 비밀번호를 확인하세요");
		}
		session.setAttribute("authAdmin", authAdmin);
		session.setMaxInactiveInterval(60*60);
		
		return JSONResult.success(true);
	}
	
	@RequestMapping(value= "/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("authAdmin");
		session.invalidate();
		return "redirect:admin/user/login";
	}
	
	@RequestMapping(value= "/join", method=RequestMethod.GET)
	public String join() {
		return "admin/user/join";
	}
	
	@ResponseBody
	@RequestMapping(value= "/join", method=RequestMethod.POST)
	public JSONResult join(@ModelAttribute UserVo userVo) {
		return adminService.join(userVo);
	}
	
	@ResponseBody
	@RequestMapping(value= "/checkId", method=RequestMethod.GET)
	public JSONResult checkOverlapId(@RequestParam String checkId) {
		
		return adminService.checkOverlapId(checkId);
		
	}
	
	@RequestMapping(value= "/list", method=RequestMethod.GET)
	public String userList(Model model) {
		
		model.addAttribute("userList", userService.getUserList());
		return "admin/user/list";
		
	}
}
