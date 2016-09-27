package com.sporthub.logic.service;

import com.sporthub.ui.template.UserProfile;

/**
 * 
 * Called by controller to work on service logics and return value
 * @author stevenjiang
 *
 */
public interface UserService {
	public UserProfile getUserProfile(String username);
}
