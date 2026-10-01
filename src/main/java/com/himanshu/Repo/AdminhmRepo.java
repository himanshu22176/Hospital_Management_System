package com.himanshu.Repo;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.himanshu.Entity.Adminhm;
import com.himanshu.Entity.Doctor;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Configuration
public class AdminhmRepo {

	EntityManagerFactory emf= Persistence.createEntityManagerFactory("himanshu");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et= em.getTransaction();
	
	
	@Bean
	public Adminhm createPatient() {
		return new Adminhm();
	}
	
	public boolean checkLogin(String email, String password) {
		Query q= em.createQuery("Select a from Adminhm a Where a.email=:email AND a.password= :pass");
		q.setParameter("email", email);
		q.setParameter("pass", password);
		return !q.getResultList().isEmpty();
	}
	
	public Adminhm findByMail(String email) {
		Query q= em.createQuery("Select p from Adminhm p Where p.email=:email");
		q.setParameter("email", email);
		return ((Adminhm)(q.getResultList().get(0)));
	}
	
	public Doctor findById(int id) {
		Doctor d = em.find(Doctor.class, id);
		return d;
	}
	
	public boolean updateDoctorStatus(Doctor d) {
		if(d==null)return false;
		et.begin();
		em.persist(d);
		et.commit();
		return true;
	}
	
	public Doctor deleteDoctor(int id) {
		Doctor d= em.find(Doctor.class, id);
		et.begin();
		em.remove(d);
		et.commit();
		return d;
	}
	
	public void addAdmin(Adminhm ad) {
		et.begin();
		em.persist(ad);
		et.commit();
	}
	
	
	public List<Adminhm> getAll(String status){
		Query q= em.createQuery("Select a from Doctor a Where a.status= :status");
		q.setParameter("status", status);
		List<Adminhm> a = q.getResultList();
		return a;
	}
	
}
