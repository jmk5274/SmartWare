package kr.or.ddit.smartware.post.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.LogException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.smartware.board.model.Board;
import kr.or.ddit.smartware.board.service.IBoardService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.post.model.Comments;
import kr.or.ddit.smartware.post.model.Post;
import kr.or.ddit.smartware.post.model.PostFile;
import kr.or.ddit.smartware.post.service.IPostService;
import kr.or.ddit.smartware.util.file.FileUtil;
import kr.or.ddit.smartware.util.file.model.FileInfo;

@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Resource(name = "postService")
	private IPostService postService;

	@Resource(name = "boardService")
	private IBoardService boardService;

	@GetMapping("post")
	public String postView(Board board, Integer page, Integer pagesize, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (page == null)
			page = 1;
		if (pagesize == null)
			pagesize = 15;

		map.put("board_id", board.getBoard_id());
		map.put("page", page);
		map.put("pagesize", pagesize);

		List<Post> postList = postService.getPostList(map);

		logger.debug("postList : {}", postList);

		List<Post> pageList = postService.allPostList(board.getBoard_id());

		int paginationSize = (int) Math.ceil((double) pageList.size() / pagesize);

		model.addAttribute("board_id", board.getBoard_id());
		model.addAttribute("board_nm", board.getBoard_nm());
		model.addAttribute("postList", postList);
		model.addAttribute("page", page);
		model.addAttribute("pagesize", pagesize);
		model.addAttribute("paginationSize", paginationSize);

		return "tiles/post/post";
	}

	@GetMapping("selectPost")
	public String selectPostView(String board_nm, String post_id, String board_id, Model model) {

		if (post_id.equals("")) {
//			String res = "삭제된 게시물입니다";
			model.addAttribute("board_nm", board_nm);
			model.addAttribute("board_id", board_id);
//			model.addAttribute("res", res);
			return "redirect:/post";
		} else {
			Map<String, Object> map = postService.selectPost(post_id);

			List<Comments> commentsList = (List<Comments>) map.get("commentsList");
			List<PostFile> postfileList = postService.getPostFile(post_id);

			model.addAttribute("postfileList", postfileList);
			model.addAttribute("board_id", board_id);
			model.addAttribute("post_id", post_id);
			model.addAttribute("post", map.get("post"));
			model.addAttribute("commentsList", commentsList);
			model.addAttribute("board_nm", board_nm);

			return "tiles/post/selectPost";
		}
	}

	@GetMapping("writePost")
	public String writePostView(String board_id, Model model) {

		model.addAttribute("pa_post_id", "0");
		model.addAttribute("gn", 0);
		model.addAttribute("board_id", board_id);

		return "tiles/post/writePost";
	}

	@PostMapping("writePost")
	public String writePost(Post post, String board_id, Model model, HttpSession session,
			@RequestPart("postFile") List<MultipartFile> postFiles) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String seq = postService.getPostSeq();
		Map<String, Object> map = new HashMap<String, Object>();

		if (post.getPa_post_id().equals("0")) {
			post.setPost_id(seq);
			post.setTitle(post.getTitle());
			post.setCont(post.getCont());
			post.setEmp_id(employee.getEmp_id());
			post.setBoard_id(post.getBoard_id());
			post.setGn(seq);

			map.put("post", post);

			postService.insertPost(map);
		} else {
			post.setPost_id(seq);
			post.setTitle(post.getTitle());
			post.setCont(post.getCont());
			post.setEmp_id(employee.getEmp_id());
			post.setBoard_id(post.getBoard_id());
			post.setPa_post_id(post.getPa_post_id());
			post.setGn(post.getGn());

			map.put("post", post);

			postService.insertPost2(map);
		}

		for (MultipartFile postFile : postFiles) {
			FileInfo fileInfo = FileUtil.getFileInfo(postFile.getOriginalFilename());

			// 첨부된 파일이 있을 경우만 업로드 처리
			if (postFile.getSize() > 0) {
				PostFile postfile = new PostFile();
				try {
					postFile.transferTo(fileInfo.getFile());
					postfile.setPost_id(seq + "");
					postfile.setFile_nm(fileInfo.getOriginalFileName()); // originalFileName
					postfile.setRealfilepath(fileInfo.getFile().getPath());

					int insertCnt = postService.insertPostFile(postfile);

				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		model.addAttribute("post_id", seq);
		model.addAttribute("board_id", board_id);

		return "redirect:/post";
	}

	@GetMapping(path = "modifyPost")
	public String modifyPostView(String board_id, Post post, String btnValue, HttpSession session, Model model) {

		Map<String, Object> map = postService.selectPost(post.getPost_id());

		Post post1 = (Post) map.get("post");
		model.addAttribute("board_id", board_id);

		if (btnValue.equals("답글")) {
			model.addAttribute("pa_post_id", post.getPost_id());
			model.addAttribute("gn", post.getGn());
			return "tiles/post/writePost";
		} else if (btnValue.equals("삭제")) {
			post.setAble("T");

			int cnt = postService.deletePost(post);

			return "redirect:/post";
		} else if (btnValue.equals("수정")) {

			List<PostFile> postfileList = postService.getPostFile(post.getPost_id());

			model.addAttribute("post_id", post.getPost_id());
			model.addAttribute("post", post1);
			model.addAttribute("postfileList", postfileList);

			return "tiles/post/modifyPost";
		}
		
		return "redirect:/post";
	}

	@PostMapping("modifyPost")
	public String modifyPost(PostFile postfile1, Post post, String board_id, String[] files, Model model,
			@RequestPart("postFile") List<MultipartFile> postFiles) {

		int cnt = postService.updatePost(post);

		// 해당 게시물의 파일 리스트
		List<PostFile> postfileList = postService.getPostFile(post.getPost_id());

		List<String> file_idList = new ArrayList<String>();

		// 수정된 게시물의 파일 개수 0개 또는 null
		if (files == null || files.length == 0) {
			for (PostFile postfile : postfileList) {
				// 첨부파일 개수가 0이거나 없으면 해당 게시물의 파일 모두 삭제
				postService.deletePostFile(postfile.getPost_id());
			}
		} 
		// 수정된 게시물의 파일 개수 1개 이상일 시
		else {
			// 수정되기 전의 게시물이 가지고 있는 파일 리스트의 아이디 리스트
			for (PostFile postfile : postfileList) {
				file_idList.add(postfile.getFile_id());
			}

			// 플래그를 통해서 수정되 파일 아이디와 수정되기 전 파일 아이디가 같을 시 false
			// 수정된 게시물에서 삭제되어 서로 매칭이 되지 않으면 true
			for (String file_id : file_idList) {
				boolean flag = true;
				for (String filenum : files) {
					if (file_id.equals(filenum)) {
						flag = false;
						break;
					}
				}
				// true일 시 해당 게시글 파일 삭제
				if (flag) {
					postService.deletePostFile(file_id);
				}
			}
		}

		for (MultipartFile postFile : postFiles) {
			FileInfo fileInfo = FileUtil.getFileInfo(postFile.getOriginalFilename());

			// 첨부된 파일이 있을 경우만 업로드 처리
			if (postFile.getSize() > 0) {
				PostFile postfile = new PostFile();
				try {
					postFile.transferTo(fileInfo.getFile());
					postfile.setPost_id(post.getPost_id());
					postfile.setFile_nm(fileInfo.getOriginalFileName()); // originalFileName
					postfile.setRealfilepath(fileInfo.getFile().getPath());

					int insertCnt = postService.insertPostFile(postfile);

				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		model.addAttribute("board_id", board_id);
		model.addAttribute("post_id", post.getPost_id());

		return "redirect:/selectPost";
	}

	@PostMapping("insertComments")
	public String insertComments(String board_id, Comments comments, Model model, HttpSession session) {

		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");

		String emp_id = employee.getEmp_id();

		Comments comment = new Comments("0", comments.getPost_id(), emp_id, null, comments.getCont(), "F",
				"0");

		postService.insertComments(comment);

		model.addAttribute("board_id", board_id);
		model.addAttribute("post_id", comments.getPost_id());

		return "redirect:/selectPost";
	}

	@PostMapping("deleteComments")
	public String DeleteComments(Comments comments, String board_id, Model model) {

		int cnt = postService.deleteComments(comments.getCom_id());

		model.addAttribute("post_id", comments.getPost_id());
		model.addAttribute("board_id", board_id);

		return "redirect:/selectPost";
	}

	@RequestMapping("fileDownloadView")
	public String fileDownloadView(PostFile postfile, String file_id, Model model) {

		postfile = postService.selectPostFile(postfile.getFile_id());

		model.addAttribute("postfile", postfile);
		return "fileDownloadView";
	}
}
