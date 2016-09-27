package com.sporthub.common.datatransfer;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.sporthub.storage.dao.CoachDAO;
import com.sporthub.storage.dao.CoachDAOImp;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.dao.UserDAOImp;
import com.sporthub.storage.entity.Coach;
import com.sporthub.storage.entity.Plan;
import com.sporthub.storage.entity.User;

public class UserAttributes extends EntityAttributes {

	private int id;
	private String username;
	private String password;
	private String nickname;
	private String firstname;
	private String lastname;
	private String email;
	//private Set<Plan> plans;
	//private String coach;
	
	public UserAttributes(){
		super();
	}
	
	//This constructor is used for update
	public UserAttributes(User user){
		this.id = user.getId();
		this.username = user.getUsername();
		this.password = user.getPassword();
		this.nickname = user.getNickname();
		this.firstname = user.getFirstname();
		this.lastname = user.getLastname();
		this.email = user.getEmail();
		//this.plans = user.getPlans();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		
		return errors;
	}

	@Override
	public User toEntity(Boolean isNew) {
		CoachDAO cdao = new CoachDAOImp(session);
		Coach coach = cdao.getCoachById(id);
		UserDAO udao = new UserDAOImp(session);
		Set<Plan> plans = udao.getUserById(id).getPlans();
		return new User(id, username, nickname, password, firstname, lastname,
				 email,coach,plans);
	}

}
