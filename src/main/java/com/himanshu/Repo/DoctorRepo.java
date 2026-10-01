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
public class DoctorRepo {

	EntityManagerFactory emf= Persistence.createEntityManagerFactory("himanshu");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et= em.getTransaction();
	
	
	@Bean
	public Doctor createPatient() {
		return new Doctor();
	}
	
	public void addDoctor(Doctor p) {
	
		et.begin();
		em.persist(p);
		et.commit();
	
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Doctor> allFind() {
		Query q= em.createQuery("Select p from Doctor p");
		List<Doctor>p= q.getResultList();
		return p;
	}
	
	public Doctor findById(int id) {
		Query q= em.createQuery("Select p from Doctor p WHERE p.id= :id");
		q.setParameter("id", id);
		 List<Doctor> d = q.getResultList();
		return d.isEmpty()?null:d.get(0);
	}
	
	public Doctor findByMail(String email) {
		Query q= em.createQuery("Select p from Doctor p Where p.email=:email");
		q.setParameter("email", email);
		List <Doctor> ld= q.getResultList();
		return ld.isEmpty()?null:ld.get(0);
	}
	
	public boolean checkLogin(String email, String password) {
		Query q= em.createQuery("Select p from Doctor p Where p.email=:email AND p.password= :pass");
		q.setParameter("email", email);
		q.setParameter("pass", password);
		return !q.getResultList().isEmpty();
	}
	
}
