package com.himanshu.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.himanshu.Entity.Adminhm;
import com.himanshu.Entity.Doctor;
import com.himanshu.Repo.AdminhmRepo;
import com.himanshu.Repo.DoctorRepo;
import com.himanshu.Util.OtpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminhmRepo ar;
	
	@Autowired
	private OtpService os;
	
	@Autowired
	private DoctorRepo dr;
	
	List<Adminhm> pending;
	List<Adminhm> approved;

	@PostMapping("/adminLogin")
	public ModelAndView login(HttpServletRequest req, HttpSession hs, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")!=null) {
			mv.setViewName("/admin/adminMenu.jsp");
			return mv;
		}
		String name=req.getParameter("adminName");
		String password= req.getParameter("adminPassword");
		boolean status= ar.checkLogin(name, password);
		if(status) {
			hs.setAttribute("loginStatus",ar.findByMail(name) );
			mv.setViewName("/admin/adminMenu.jsp");
		}
		else {
			hs.setAttribute("error", "Invalid Login Details");
			mv.setViewName("/admin/Main.jsp");
		}
		return mv;
	}
	
	@PostMapping("/reviewDoctor")
	public ModelAndView reviewDoc(HttpSession hs, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}		
		this.pending=ar.getAll("Pending");
		mv.setViewName("/admin/reviewDoctor.jsp");
		mv.addObject("doctorList", this.pending);
		return mv;
	}
	
	
	@PostMapping("/approve")
	public ModelAndView approveDoctor(HttpSession hs, HttpServletRequest req, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}
		int id=Integer.parseInt(req.getParameter("id"));
		hs.setAttribute("id", id);
		mv.setViewName("/admin/addFees.jsp");
		return mv;
	}
	
	@PostMapping("/fees")
	public ModelAndView addFees(HttpSession hs, HttpServletRequest req, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}
		int id= (Integer)hs.getAttribute("id");
		Doctor d= ar.findById(id);
		d.setFees(req.getParameter("fees"));
		d.setStatus("Approved");
		ar.updateDoctorStatus(d);
		os.sendAcceptanceMail(d.getEmail());
		mv.setViewName("/admin/reviewDoctor.jsp");
		return mv;
	}

	@PostMapping("/reject")
	public ModelAndView rejectDoctor(HttpSession hs, HttpServletRequest req, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}
		int id=Integer.parseInt(req.getParameter("id"));
		Doctor d = ar.deleteDoctor(id);
		os.sendRejectionMail(d.getEmail());
		mv.setViewName("/admin/reviewDoctor.jsp");
		return mv;
	}
	
	
	@PostMapping("/invokeDoctor")
	public ModelAndView invokeDoc(HttpSession hs, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}		
		this.approved=ar.getAll("Approved");
		mv.setViewName("/admin/invokeDoctor.jsp");
		mv.addObject("doctorList", this.approved);
		return mv;
	}
	
	
	@PostMapping("/removeDoctor")
	public ModelAndView removeDoctor(HttpSession hs, HttpServletRequest req, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {
			mv.setViewName("/admin/Main.jsp");
			return mv;
		}
		int id= Integer.parseInt(req.getParameter("id"));
		Doctor d = ar.deleteDoctor(id);
		os.sendTerminationMail(d.getEmail());
		mv.setViewName("/admin/adminMenu.jsp");
		return mv;
	}
	
	
	@GetMapping("/logoutAdmin")
	public ModelAndView logout(HttpSession hs, ModelAndView mv) {
		hs.setAttribute("loginStatus", null);
		mv.setViewName("/admin/Main.jsp");
		return mv;
	}
	
	@PostMapping("/addAdmin")
	public ModelAndView addAdmin(HttpSession hs, ModelAndView mv) {
		if(hs.getAttribute("loginStatus")==null) {

			mv.setViewName("/admin/Main.jsp");
			return mv;
		}	
		mv.setViewName("/admin/addAdmin.jsp");
		return mv;
	}
	
	@PostMapping("/newAdmin")
	public ModelAndView addAdmin(@ModelAttribute Adminhm adminhm) {
//		ar.addAdmin(adminhm);
		System.out.println(adminhm.getEmail());
		
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.addObject("success", "Successfuly Added");
		modelAndView.setViewName("/admin/adminMenu.jsp");
		return modelAndView;
	}
	
}
