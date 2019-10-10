package kr.or.ddit.smartware.board.service;

import java.util.List;

import kr.or.ddit.smartware.board.model.Board;

public interface IBoardService {
	
	public List<Board> getBoardList();
	
	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public Board getBoard(String board_id);

}
