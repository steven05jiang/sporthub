package com.sporthub.logic.service;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.ui.template.UserProfile;

/**
 * 
 * Called by controller to work on service logics and return value
 * @author stevenjiang
 *
 */
public interface UserService {
	public UserProfile getUserProfile(String username);
	public void updateUserProfile(String username, UserAttributes user) throws InvalidParametersException;
}
