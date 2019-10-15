package kr.or.ddit.smartware.board.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.smartware.board.model.Board;
import kr.or.ddit.smartware.board.service.IBoardService;
import kr.or.ddit.smartware.employee.model.Employee;

@Controller
public class BoardController {
	@Resource(name = "boardService")
    private IBoardService boardService;   
	
	/**
	 * 
	* Method : addBoard
	* 작성자 : PC-04
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 게시판 관리 화면 요청
	 */
	@GetMapping("addBoard")
	public String addBoard(Model model) {
		return "tiles/board/addBoard";
	}
	
	/**
	 * 
	* Method : insertBoard
	* 작성자 : PC-04
	* 변경이력 :
	* @param btnValue
	* @param model
	* @param session
	* @param board
	* @param request
	* @return
	* Method 설명 : 게시판 생성, 수정
	 */
	@PostMapping("addBoard")
	public String insertBoard(String btnValue, Model model, HttpSession session, Board board, HttpServletRequest request) {
		
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		board.setEmp_id(employee.getEmp_id());
		
		if(board.getAble().equals("사용")) {
			board.setAble("T");
		}else {
			board.setAble("F");
		}
		
		if(btnValue.equals("생성")) {
			
			int cnt = boardService.insertBoard(board);
			
		}else if(btnValue.equals("수정")) {
				
			int cnt = boardService.updateBoard(board);
			
		}
		
		request.getServletContext().setAttribute("A_BOARDLIST", boardService.getBoardList()); 
		
		return "tiles/board/addBoard";
	}
}
