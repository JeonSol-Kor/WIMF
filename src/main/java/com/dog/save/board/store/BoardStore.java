package com.dog.save.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.board.domain.Board;

public interface BoardStore {

	/**
	 * 게시판 리스트 Store
	 * @param sqlSession
	 * @return
	 */
	List<Board> selectBoardList(SqlSession sqlSession);

}