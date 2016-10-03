package com.sporthub.logic.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.SportAttributes;
import com.sporthub.storage.dao.SportDAO;
import com.sporthub.storage.entity.Sport;
import com.sporthub.ui.template.SportTypeTemplate;

public class SportServiceImp implements SportService {

	@Autowired
	private SessionFactory sf;
	@Autowired
	private SportDAO sdao;
	
	public SportServiceImp(){
		super();
	}
	
	public SportDAO getSdao() {
		return sdao;
	}
	public void setSdao(SportDAO sdao) {
		this.sdao = sdao;
	}
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	@Override
	public Set<SportTypeTemplate> getAllSportTypes() {
		try{
			Session session = sf.openSession();
			try{
				sdao.setSession(session);
				Set<SportTypeTemplate> res = new HashSet<SportTypeTemplate>();
				for(Sport sport : sdao.getAllSports()){
					SportAttributes sa = new SportAttributes(sport);
					SportTypeTemplate template = new SportTypeTemplate(sa);
					res.add(template);
				}
				return res;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in getting your plans.");
		}
	}

}
