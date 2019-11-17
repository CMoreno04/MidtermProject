package com.skilldistillery.upstream.data;

import com.skilldistillery.upstream.entities.User;

public interface LoginDAO {
	
	public boolean checkIsUniqueUser(User user);
	
	public User checkUserRegistration(User userIn);
}
