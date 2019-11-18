package com.skilldistillery.upstream.data;

import com.skilldistillery.upstream.entities.User;

public interface LoginDAO {
	
	public User checkUserRegistration(User userIn);
	
	public User findUserByUsernameAndPassword(String usernameIn, String passwordIn);
}
