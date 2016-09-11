package com.sporthub.storage.entity;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "coaches")
public class Coach {
	@Id
	@Column(name = "id")
	private int id;
	@OneToMany(mappedBy = "coach", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Plan> plans;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Set<Plan> getPlans() {
		return plans;
	}
	public void setPlans(Set<Plan> plans) {
		this.plans = plans;
	}
	
	public Coach(int id) {
		super();
		this.id = id;
	}
	public Coach() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
