package com.sporthub.storage.entity;

import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "coaches")
public class Coach {
	@Id
    @GeneratedValue(generator = "gen")
    @GenericGenerator(name="gen", strategy="foreign",
    	parameters = @Parameter(name = "property", value="user"))
	@Column(name = "id")
	private int id;
	@OneToMany(mappedBy = "coach", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Plan> plans;
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private User user;
	
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
