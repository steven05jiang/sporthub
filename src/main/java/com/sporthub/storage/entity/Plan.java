package com.sporthub.storage.entity;

import java.sql.Timestamp;
import java.util.Date;

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
	@Column(name = "description")
	private String description;
	@Column(name = "createDate")
	private Timestamp createDate;
	@Column(name = "expireDate")
	private Timestamp expireDate;
	//0 for uncompleted, 1 for completed
	@Column(name = "complete")
	private int complete;
	@ManyToOne(optional = false)
	@JoinColumn(name = "uId", nullable = false)
	private User user;
	@ManyToOne
	@JoinColumn(name = "coachId")
	private Coach coach;
	@ManyToOne(optional = false)
	@JoinColumn(name = "sportId", nullable = false)
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Timestamp expireDate) {
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
	public Plan(int id, String name, String description, Timestamp createDate, Timestamp expireDate, int complete, User user,
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
