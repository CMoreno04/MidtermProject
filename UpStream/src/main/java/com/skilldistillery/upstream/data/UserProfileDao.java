package com.skilldistillery.upstream.data;

import java.util.List;

import com.skilldistillery.upstream.entities.User;
import com.skilldistillery.upstream.entities.UserImage;

public interface UserProfileDao {

	public List<UserImage> getProfilePics();
	public User addUserProfilePic(int userId, int pid);
}
