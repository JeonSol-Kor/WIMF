package com.dog.save.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.user.domain.User;
import com.dog.save.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public User checkDuplUserId(SqlSession session, String userId) {
		User uOne = session.selectOne("UserMapper.checkDuplUserId", userId);
		return uOne;
	}

	@Override
	public User checkDuplUserNickname(SqlSession session, String userNickname) {
		User uOne = session.selectOne("UserMapper.checkDuplUserNickname", userNickname);
		return uOne;
	}

	@Override
	public User checkDuplUserEmail(SqlSession session, String userEmail) {
		User uOne = session.selectOne("UserMapper.checkDuplUserEmail", userEmail);
		return uOne;
	}

	@Override
	public User checkLogin(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.checkLogin", user);
		return uOne;
	}

	@Override
	public User checkUserByNameEmail(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.checkUserByNameEmail", user);
		return uOne;
	}

	@Override
	public User checkUserByNameIdEmail(SqlSession session, User user) {
		User UOne = session.selectOne("UserMapper.checkUserByNameIdEmail", user);
		return UOne;
	}

	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

}
