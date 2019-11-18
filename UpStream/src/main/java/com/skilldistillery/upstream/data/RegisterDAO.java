package com.skilldistillery.upstream.data;

import com.skilldistillery.upstream.entities.User;

public interface RegisterDAO {

	public User addUser(User user);

	public boolean checkIsUniqueUser(User user);
	
	public User updateUser(User user);
	
}
