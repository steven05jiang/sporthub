package com.sporthub.common.datatransfer;

import java.util.ArrayList;
import java.util.List;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.dao.UserDAOImp;
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
		User user = null;
		if(!isNew){
			UserDAO udao = new UserDAOImp(session);
			user = udao.getUserById(id);
		}else{
			user = new User();
			user.setUsername(username);
		}
		user.setPassword(password);
		user.setNickname(nickname);
		user.setLastname(lastname);
		user.setFirstname(firstname);
		user.setEmail(email);
		return user;
	}

	@Override
	public void sanitizeForDeleting(Object obj) {
		// TODO Auto-generated method stub
		
	}

}
