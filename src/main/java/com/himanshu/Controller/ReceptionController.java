package com.himanshu.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.himanshu.Entity.Patient;
import com.himanshu.Service.PatientService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReceptionController {

	PatientService ps= new PatientService();
	
	@PostMapping("/patient")
	public String addPatient(HttpServletRequest req) {
		
		ps.addPatient(req.getParameter("name"), Integer.parseInt(req.getParameter("age")),Long.parseLong(req.getParameter("phone")), req.getParameter("disease"));
		return "/patient/redirectSuccessPatient.jsp";
	}
	
	@GetMapping("/patient")
	public String viewPatient(HttpServletRequest req, Model m) {
		int id =Integer.parseInt(req.getParameter("id"));
		Patient p=  ps.viewPatient(id);
		if(p==null)return "/patient/redirectPatientFailed.jsp";
		m.addAttribute("patientId",p.getId());
		m.addAttribute("patientName",p.getName());
		m.addAttribute("patientAge",p.getAge());
		m.addAttribute("patientPhone",p.getPhone_number());
		m.addAttribute("patientDisease",p.getDisease());
		return "/patient/viewPatient.jsp";
	}
	
	@GetMapping("/deletePatient")
	public String deletPatient(HttpServletRequest req, Model m) {
		int id =Integer.parseInt(req.getParameter("id"));
		if(ps.deletePatient(id)==false)return "/patient/redirectPatientFailed.jsp";
		return "/patient/redirectDeletePatientSuccess.jsp";
	}
	
	@GetMapping("/viewPatient")
	public String viewPatient(Model m, HttpServletRequest req) {
		List<Patient> p = ps.allFind();
		req.setAttribute("li", p);
		
		m.addAttribute("objView", p);
		return "/patient/viewAllPatient.jsp";
	}
	
}
