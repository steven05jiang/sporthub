package com.sporthub.storage.entity;

import javax.persistence.*;

@Entity
@Table(name = "plans")
public class Plan {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "descrption")
	private String description;
	@Column(name = "createDate")
	private String createDate;
	@Column(name = "expireDate")
	private String expireDate;
	@Column(name = "complete")
	private int complete;
	@ManyToOne(optional = false)
	@JoinColumn(name = "uId")
	private User user;
	@ManyToOne
	@JoinColumn(name = "coachId")
	private Coach coach;
	@ManyToOne(optional = false)
	@JoinColumn(name = "sportId")
	private Sport sport;
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
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Coach getCoach() {
		return coach;
	}
	public void setCoach(Coach coach) {
		this.coach = coach;
	}
	public Sport getSport() {
		return sport;
	}
	public void setSport(Sport sport) {
		this.sport = sport;
	}
	public Plan(int id, String name, String description, String createDate, String expireDate, int complete, User user,
			Coach coach, Sport sport) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createDate = createDate;
		this.expireDate = expireDate;
		this.complete = complete;
		this.user = user;
		this.coach = coach;
		this.sport = sport;
	}
	public Plan() {
		super();
		// TODO Auto-generated constructor stub
	}
}
