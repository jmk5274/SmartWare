package kr.or.ddit.smartware.board.repository;

import java.util.List;

import kr.or.ddit.smartware.board.model.Board;

public interface IBoardDao {
	
	public List<Board> getBoardList();
	
	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public Board getBoard(String board_id);

}
