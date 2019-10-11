package kr.or.ddit.smartware.post.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.post.model.Comments;
import kr.or.ddit.smartware.post.model.Post;
import kr.or.ddit.smartware.post.model.PostFile;
import kr.or.ddit.smartware.post.repository.IPostDao;

@Service
public class PostService implements IPostService {

	@Resource(name = "postDao")
	private IPostDao dao;
	
	@Override
	public List<Post> getPostList(Map map) {
		List<Post> list = dao.getPostList(map);
		return list;
	}
	
	@Override
	public Map<String, Object> selectPost(String post_id) {
		Post post = dao.selectPost(post_id);
		List<Comments> commentsList = dao.getCommentsList(post_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("post_id", post_id);
		map.put("post", post);
		map.put("commentsList", commentsList);
		return map;
	}

	@Override
	public int insertComments(Comments comments) {
		int cnt = dao.insertComments(comments);
		return cnt;
	}

	@Override
	public int insertPost(Map map) {
		Post post = (Post) map.get("post");
		
		int cnt = dao.insertPost(post);
		return cnt;
	}

	@Override
	public int insertPost2(Map map) {
		String seq = dao.getPostSeq();
		Post post = (Post) map.get("post");
		
		int cnt = dao.insertPost2(post);
		return cnt;
	}

	@Override
	public List<Post> allPostList(String board_id) {
		List<Post> list = dao.allPostList(board_id);
		return list;
	}

	@Override
	public String getPostSeq() {
		String seq = dao.getPostSeq();
		return seq;
	}

	@Override
	public int insertPostFile(PostFile postfile) {
		int cnt = dao.insertPostFile(postfile);
		return cnt;
	}

	@Override
	public int deletePost(Post post) {
		int cnt = dao.deletePost(post);
		return cnt;
	}

	@Override
	public int updatePost(Post post) {
		int cnt = dao.updatePost(post);
		return cnt;
	}

	@Override
	public List<PostFile> getPostFile(String post_id) {
		List<PostFile> list = dao.getPostFile(post_id);
		return list;
	}

	@Override
	public int deletePostFile(String file_id) {
		int cnt = dao.deletePostFile(file_id);
		return cnt;
	}

	@Override
	public int deleteComments(String com_id) {
		int cnt = dao.deleteComments(com_id);
		return cnt;
	}

	@Override
	public PostFile selectPostFile(String com_id) {
		PostFile postfile = dao.selectPostFile(com_id);
		return postfile;
	}

}
