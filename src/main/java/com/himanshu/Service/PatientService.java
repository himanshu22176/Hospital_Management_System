package com.himanshu.Service;

import java.util.List;

import com.himanshu.Entity.Patient;
import com.himanshu.Repo.PatientRepo;

public class PatientService {
	
	private PatientRepo pr=new PatientRepo();
	
	public void addPatient(String name, int age, long phone_number, String disease) {
		Patient p= new Patient();
		p.setName(name);
		p.setAge(age);
		p.setPhone_number(phone_number);
		p.setDisease(disease);
		
		pr.addPatient(p);
	}
	
	public List<Patient> allFind(){
		return pr.allFind();
	}
	
	public Patient viewPatient(int id) {
		return pr.viewPatient(id);
	}
	
	public boolean deletePatient(int id) {
		return pr.deletePatient(id);
	}

}
