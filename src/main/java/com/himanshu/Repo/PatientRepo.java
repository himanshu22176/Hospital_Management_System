package com.himanshu.Repo;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.himanshu.Entity.Doctor;
import com.himanshu.Entity.Patient;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Configuration
public class PatientRepo {

	EntityManagerFactory emf= Persistence.createEntityManagerFactory("himanshu");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et= em.getTransaction();
	
	
	@Bean
	public Patient createPatient() {
		return new Patient();
	}
	
	public void addPatient(Patient p) {
	
		et.begin();
		em.persist(p);
		et.commit();
	
	}
	public Patient viewPatient(int id) {
		
		return em.find(Patient.class, id);
		
	}
	
	public boolean deletePatient(int id) {
		Patient p= em.find(Patient.class, id);
		if(p==null)return false;
		et.begin();
		em.remove(p);
		et.commit();
		return true;
	}
	public int getId(String email) {
		Query q= em.createQuery("Select p from Patient p Where p.email=:email");
		q.setParameter("email", email);
		return ((Patient)(q.getResultList().get(0))).getId();
	}
	
	public Patient findByMail(String email) {
		Query q= em.createQuery("Select p from Patient p Where p.email=:email");
		q.setParameter("email", email);
		return ((Patient)(q.getResultList().get(0)));
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Patient> allFind() {
		Query q= em.createQuery("Select p from Patient p");
		List<Patient>p= q.getResultList();
		return p;
	}
	
	public boolean checkLogin(String email, String password) {
		Query q= em.createQuery("Select p from Patient p Where p.email=:email AND p.password= :pass");
		q.setParameter("email", email);
		q.setParameter("pass", password);
		return !q.getResultList().isEmpty();
	}
	
	public Patient findById(int id) {
		return em.find(Patient.class, id);
	}
	
	public void bookAppointment(Patient p, Doctor d) {
		
		et.begin();
		em.merge(p);
		em.merge(d);
		et.commit();
	
	}
	
	
	public void deleteAppointment(int pid, int did) {
		Patient p= em.find(Patient.class, pid);
		List<Doctor> d= p.getDoctor();
		Doctor remove= null;
		for(Doctor r: d) {
			if(r.getId()==did)remove= r;;
		}
		d.remove(remove);
		p.setDoctor(d);
		et.begin();
		em.merge(p);
		et.commit();
	}
	
	
	
}
