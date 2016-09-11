package com.sporthub.logic.service;

import com.sporthub.common.datatransfer.EmailAttributes;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.storage.entity.User;
import com.sporthub.webservice.template.Result;
import com.sporthub.webservice.template.UserEmailCheck;

public interface UserRegService {
	public Result createUser(UserAttributes user);
	public UserEmailCheck isEmailAvailable(EmailAttributes email);
	public User getUser(int id);
}
