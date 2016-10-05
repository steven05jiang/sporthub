package com.sporthub.logic.service;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.ui.template.UserEmailCheck;
import com.sporthub.ui.template.UsernameCheck;

public interface UserRegService {
	public void createUser(UserAttributes user) throws InvalidParametersException;
	public UserEmailCheck isEmailAvailable(String email) throws InvalidParametersException;
	//public User getUser(int id);
	public UsernameCheck isUsernameAvailable(String username) throws InvalidParametersException;
}
