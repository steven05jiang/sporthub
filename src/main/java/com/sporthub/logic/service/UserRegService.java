package com.sporthub.logic.service;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.Result;
import com.sporthub.ui.template.UserEmailCheck;

public interface UserRegService {
	public Result createUser(UserAttributes user);
	public UserEmailCheck isEmailAvailable(String email);
	public User getUser(int id);
}
