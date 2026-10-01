package com.himanshu.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import jakarta.servlet.http.HttpSession;

@Controller
public class PatientController {

	@Autowired
	private OtpService ots;

	@Autowired
	private PatientRepo pr;

	@Autowired
	private DoctorRepo dr;

	private String otp;

	@GetMapping("/registerOtp")
	public ModelAndView sendOtp(HttpServletRequest req, ModelAndView m, HttpSession hs) throws Exception {
		String password = req.getParameter("userPassword");
		System.out.println(password);
		if (!password.equals(req.getParameter("userConPassword"))) {
			req.setAttribute("errorMessage", "Password Not Matching!!!!");
			return new ModelAndView("/patient/registerPatient.jsp");
		}
		otp = OtpGenerator.generateOtp();
		String email = (String) req.getParameter("userEmail");
		ots.sentOtpEmail(email, otp);
		m.addObject("patientId", otp);
		Patient p = new Patient();
		p.setName(req.getParameter("userName"));
		p.setEmail(req.getParameter("userEmail"));
		p.setAge(Integer.parseInt(req.getParameter("userAge")));
		p.setPassword(req.getParameter("userPassword"));
		p.setPhone_number(Long.parseLong(req.getParameter("userPhone")));
		m.setViewName("/patient/enterOtp.jsp");
		hs.setAttribute("pa", p);
		return m;
	}
	@GetMapping("/checkOtp")
	public String checkOtp(HttpServletRequest req, ModelAndView mav, @SessionAttribute("pa") Patient p) {
		String a = req.getParameter("otpDetails");
		if (a.equals(otp)) {
			pr.addPatient(p);
			return "/patient/registrationSuccess.jsp";
		}
		return "/patient/registrationFailed.jsp";
	}

	@PostMapping("/patientLogin")
	public String login(HttpServletRequest req, HttpSession hs) {
		if (hs.getAttribute("loginStatusPat") != null)
			return "/patient/patientMenu.jsp";
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		boolean status = pr.checkLogin(email, password);
		if (status) {
			hs.setAttribute("loginStatusPat", pr.findByMail(email));
		}
		return status ? "/patient/patientMenu.jsp" : "/patient/patientLogin.jsp";
	}

	@GetMapping("/bookAppointment")
	public String book(HttpSession hs, HttpServletRequest req) {
		if (hs.getAttribute("loginStatusPat") != null) {
			List<Doctor> d = dr.allFind();
			List<Doctor> remove = new ArrayList<>();
			for (Doctor re : d) {
				if (re.getStatus().equals("Pending"))
					remove.add(re);
			}
			d.removeAll(remove);
			if (d.isEmpty()) {
				d = new ArrayList<Doctor>();
				d.add(new Doctor());
				d.get(0).setId(0);
				d.get(0).setName("NA");
			}
			req.setAttribute("docNames", d);
			return "/patient/bookAppointmentPatient.jsp";
		}
		return "/patient/patientLogin.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession hs) {
		hs.setAttribute("loginStatusPat", null);
		return "/patient/patientLogin.jsp";
	}

	@GetMapping("/calculateFees")
	public ModelAndView calculateFees(HttpSession hs, ModelAndView mv, HttpServletRequest req) {
		if (hs.getAttribute("loginStatusPat") == null) {
			mv.setViewName("/patient/patientLogin.jsp");
			return mv;
		}
		System.out.println(req.getParameter("docName"));
		if(req.getParameter("docName")!=null) {
		int docId = Integer.parseInt(req.getParameter("docName"));
		System.out.println(docId);
		Doctor d = dr.findById(docId);
		mv.addObject("doctor", d);
		hs.setAttribute("problem", req.getParameter("problem"));
		hs.setAttribute("doc", d.getId());
		}
		mv.setViewName("/patient/bookAppointmentPatient.jsp");
		return mv;
	}

	@GetMapping("/book")
	public String bookApp(HttpServletRequest req, HttpSession hs) {
		Patient p = pr.findById(((Patient) hs.getAttribute("loginStatusPat")).getId());
		p.setDisease((String)hs.getAttribute("problem"));
		int docId = (Integer) hs.getAttribute("doc");
		Doctor d = dr.findById(docId);
		List<Doctor> ld;
		if (p.getDoctor() != null) {
			ld = p.getDoctor();
			ld.add(d);
			p.setDoctor(ld);
		}
		else {
			ld= new ArrayList<Doctor>();
			ld.add(d);
			p.setDoctor(ld);
		}
		List<Patient> lp ;
		if(d.getPatient()!=null) {
			lp= d.getPatient();
			lp.add(p);
			d.setPatient(lp);
		}
		else {
			lp= new ArrayList<Patient>();
			lp.add(p);
			d.setPatient(lp);
		}
		pr.bookAppointment(p, d);

		return "/patient/patientMenu.jsp";
	}

	@GetMapping("/logoutPatient")
	public ModelAndView logout(HttpSession hs, ModelAndView mv) {
		hs.setAttribute("loginStatusPat", null);
		mv.setViewName("/patient/patientLogin.jsp");
		return mv;
	}

}
