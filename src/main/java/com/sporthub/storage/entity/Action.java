package com.sporthub.storage.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "actions")
public class Action {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name = "name")
	private String name;
	@Column(name = "description")
	private String description;
	@Column(name = "actiondate")
	private Timestamp time;
	@Column(name = "repeatid")
	private int repeat;
	@Column(name = "quantity")
	private int quantity;
	@Column(name = "qunit")
	private String unit;
	@ManyToOne(optional = false)
	@JoinColumn(name = "planId", nullable = false)
	private Plan plan;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public Action() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Action(int id, String name, String description, Timestamp time, int repeat, int quantity, String unit,
			Plan plan) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.time = time;
		this.repeat = repeat;
		this.quantity = quantity;
		this.unit = unit;
		this.plan = plan;
	}
}
