package kr.or.ddit.smartware.post.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.board.model.Comments;
import kr.or.ddit.smartware.post.model.Post;
import kr.or.ddit.smartware.post.model.PostFile;

public interface IPostDao {
	
	public List<Post> allPostList(int board_id);
	
	/**
	 * 
	* Method : getPostList
	* 작성자 : PC-04
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : board_id를 파라미터로 보내 일치하는 게시판 리스트를 가져온다.
	 */
	public List<Post> getPostList(Map map);
	
	/**
	 * 
	* Method : selectPost
	* 작성자 : PC-04
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : post_id를 파라미터로 보내 일치하는 게시글 정보를 가져온다.
	 */
	public Post selectPost(int post_id);
	
	/**
	 * 
	* Method : getCmtList
	* 작성자 : PC-04
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : post_id를 파라미터로 보내 일치하는 덧글 리스트를 가져온다.
	 */
	public List<Comments> getCmtList(int post_id);
	
	/**
	 * 
	* Method : insertCmt
	* 작성자 : PC-04
	* 변경이력 :
	* @param comments
	* @return
	* Method 설명 : 덧글 저장
	 */
	public int insertCmt(Comments comments);
	
	public int getPostSeq();
	
	public int insertPost(Post post);
	
	public int insertPost2(Post post);
	
	public int insertPostFile(PostFile postfile);
	
	public int deletePost(Post post);
	
	public int updatePost(Post post);
	
	public List<PostFile> getPostFile(int post_id);
	
	public int deletePostFile(int file_id);
	
	public int deleteComments(int com_id);
	
	public PostFile selectPostFile(int file_id);
}
