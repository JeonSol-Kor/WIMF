package com.dog.save.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;
import com.dog.save.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardStore bStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Board> selectBoardList(bPageInfo bpInfo) {
		List<Board> bList = bStore.selectBoardList(sqlSession, bpInfo);
		return bList;
	}

	@Override
	public int insertBoard(Board board) {
		int result = bStore.insertBoard(sqlSession, board);
		return result;
	}

	@Override
	public Board showOneByBoard(Integer boardNo) {
		Board board = bStore.selectOneByBoard(sqlSession, boardNo);
		return board;
	}

	@Override
	public int getListCount() {
		int result = bStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public Board selectBoardByNo(Integer boardNo) {
		Board board = bStore.selectBoardByNo(sqlSession, boardNo);
		return board;
	}

	@Override
	public int updateBoardByNo(Board board) {
		int result = bStore.updateBoard(sqlSession, board);
		return result;
	}

}