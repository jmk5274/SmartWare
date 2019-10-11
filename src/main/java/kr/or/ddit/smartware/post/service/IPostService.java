package kr.or.ddit.smartware.post.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.post.model.Comments;
import kr.or.ddit.smartware.post.model.Post;
import kr.or.ddit.smartware.post.model.PostFile;

public interface IPostService {
	
public List<Post> allPostList(String board_id);
	
	/**
	 * 
	* Method : getPostList
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : board_id를 파라미터로 보내 일치하는 게시판 리스트를 가져온다.
	 */
	public List<Post> getPostList(Map map);
	
	/**
	 * 
	* Method : selectPost
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : post_id를 파라미터로 보내 일치하는 게시글에 출력될 정보들을 가져온다.
	 */
	public Map<String, Object> selectPost(String post_id);
	
	/**
	 * 
	* Method : insertComments
	* 작성자 : Hong Da Eun
	* 변경이력 :
	* @param cvo
	* @return
	* Method 설명 : 덧글 등록
	 */
	public int insertComments(Comments comments);
	
	public int insertPost(Map map);
	
	public int insertPost2(Map map);
	
	public String getPostSeq();
	
	public int insertPostFile(PostFile postfile);
	
	public int deletePost(Post post);
	
	public int updatePost(Post post);
	
	public List<PostFile> getPostFile(String post_id);
	
	public int deletePostFile(String file_id);
	
	public int deleteComments(String com_id);
	
	public PostFile selectPostFile(String file_id);
}
