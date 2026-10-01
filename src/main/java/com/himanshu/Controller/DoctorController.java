package com.himanshu.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.himanshu.Entity.Doctor;
import com.himanshu.Entity.Patient;
import com.himanshu.Repo.DoctorRepo;
import com.himanshu.Repo.PatientRepo;
import com.himanshu.Util.OtpGenerator;
import com.himanshu.Util.OtpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class DoctorController {

	@Autowired
	private OtpService ots;

	@Autowired
	private DoctorRepo pr;

	@Autowired
	private PatientRepo patRepo;

	private String otp;

	@PostMapping("/redirectRegister")
	public ModelAndView redirectToRegister() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/doctor/registerDoctor.jsp");
		return mv;
	}

	@PostMapping("/registerOtpDoctor")
	public ModelAndView senOtp(HttpServletResponse resp, HttpServletRequest req, Model m, HttpSession hs)
			throws Exception {
		String password = req.getParameter("userPassword");
		if (!password.equals(req.getParameter("userConPassword"))) {
			req.setAttribute("errorMessage", "Password Not Matching!!!!");
			return new ModelAndView("/doctor/registerDoctor.jsp");
		}
		otp = OtpGenerator.generateOtp();
		String email = (String) req.getParameter("userEmail");
		ots.sentOtpEmail(email, otp);
		m.addAttribute("patientId", otp);
		hs.setAttribute("registerStatus", null);
		Doctor p = new Doctor();
		p.setName(req.getParameter("userName"));
		p.setEmail(req.getParameter("userEmail"));
		p.setAge(Integer.parseInt(req.getParameter("userAge")));
		p.setPassword(req.getParameter("userPassword"));
		p.setPhone(Long.parseLong(req.getParameter("userPhone")));
		p.setSpeciality(req.getParameter("docSpec"));
		p.setStatus("Pending");
		ModelAndView mv = new ModelAndView("/doctor/enterOtp.jsp");
		hs.setAttribute("pa", p);
		return mv;
	}

	@GetMapping("/checkOtpDoctor")
	public ModelAndView checkOtp(HttpServletRequest req, ModelAndView mav, @SessionAttribute("pa") Doctor p,
			HttpSession hs) {
		String a = req.getParameter("otpDetails");
		if (a.equals(otp)) {
			pr.addDoctor(p);
			hs.setAttribute("registerStatus", "Success");
			mav.setViewName("/doctor/doctorLogin.jsp");
		} else {
			hs.setAttribute("registerStatus", "invalid");
			mav.setViewName("/doctor/enterOtp.jsp");
		}

		return mav;
	}

	@GetMapping("/doctorLogin")
	public String login(HttpServletRequest req, HttpSession hs) {
		hs.setAttribute("loginStatusDoc", null);
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		boolean ch = pr.checkLogin(email, password);
		Doctor d = pr.findByMail(email);
		if (ch && d != null && d.getStatus().equals("Approved")) {
			hs.setAttribute("loginStatusDoc", d);
			hs.setAttribute("status", email);
			return "/doctor/doctorMenu.jsp";
		} else {
			return "/doctor/doctorLogin.jsp";
		}

	}

	@GetMapping("/viewApp")
	public ModelAndView viewAppointment(HttpSession hs, ModelAndView mv) {
		if (hs.getAttribute("loginStatusDoc") == null) {
			mv.setViewName("/doctor/doctorLogin.jsp");
			return mv;
		}
		Doctor d = (Doctor) hs.getAttribute("loginStatusDoc");
		List<Patient> ap = patRepo.allFind();

		List<Patient> valid = new ArrayList<Patient>();
		for (Patient o : ap) {
			List<Doctor> dll = o.getDoctor();
			for (Doctor b : dll) {
				if (b.getId() == d.getId())
					valid.add(o);
			}
		}
		mv.setViewName("/doctor/viewAppointment.jsp");
		mv.addObject("patientList", valid);
		return mv;
	}

	@GetMapping("/logoutDoctor")
	public ModelAndView logout(HttpSession hs, ModelAndView mv) {
		hs.setAttribute("loginStatusDoc", null);
		mv.setViewName("/doctor/doctorLogin.jsp");
		return mv;
	}

	@GetMapping("/closeAppointment")
	public ModelAndView closeAppointmentPage(HttpSession hs, ModelAndView mv) {
		if (hs.getAttribute("loginStatusDoc") == null) {
			mv.setViewName("/doctor/doctorLogin.jsp");
			return mv;
		}
		Doctor d = (Doctor) hs.getAttribute("loginStatusDoc");
		List<Patient> ap = patRepo.allFind();

		List<Patient> valid = new ArrayList<Patient>();
		for (Patient o : ap) {
			List<Doctor> dll = o.getDoctor();
			for (Doctor b : dll) {
				if (b.getId() == d.getId())
					valid.add(o);
			}
		}
		mv.setViewName("/doctor/closeAppointment.jsp");
		mv.addObject("patientList", valid);
		return mv;
	}
	
	
	@PostMapping("/close")
	public ModelAndView closeAppointment(HttpSession hs, ModelAndView mv, HttpServletRequest req) {
		if (hs.getAttribute("loginStatusDoc") == null) {
			mv.setViewName("/doctor/doctorLogin.jsp");
			return mv;
		}
		Doctor d=(Doctor) hs.getAttribute("loginStatusDoc");
		patRepo.deleteAppointment(Integer.parseInt(req.getParameter("id")), d.getId());
		mv.setViewName("/doctor/closeAppointment.jsp");
		return mv;
	}

}
