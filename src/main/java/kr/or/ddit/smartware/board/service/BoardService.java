package kr.or.ddit.smartware.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.board.model.Board;
import kr.or.ddit.smartware.board.repository.IBoardDao;

@Service
public class BoardService implements IBoardService{
	@Resource(name = "boardDao")
	private IBoardDao dao;
	
	@Override
	public List<Board> getBoardList() {
		List<Board> list = dao.getBoardList();
		return list;
	}

	@Override
	public int insertBoard(Board board) {
		int cnt = dao.insertBoard(board);
		return cnt;
	}

	@Override
	public int updateBoard(Board board) {
		int cnt = dao.updateBoard(board);
		return cnt;
	}

	@Override
	public Board getBoard(String board_id) {
		Board board = dao.getBoard(board_id);
		return board;
	}
}
