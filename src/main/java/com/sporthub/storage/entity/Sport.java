package com.sporthub.storage.entity;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "sports")
public class Sport {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "description")
	private String description;
	@Column(name = "createDate")
	private String createDate;
	@OneToMany(mappedBy = "sport" ,cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Plan> plans;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Set<Plan> getPlans() {
		return plans;
	}
	public void setPlans(Set<Plan> plans) {
		this.plans = plans;
	}
	public Sport(int id, String name, String description, String createDate) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createDate = createDate;
	}
	public Sport() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}