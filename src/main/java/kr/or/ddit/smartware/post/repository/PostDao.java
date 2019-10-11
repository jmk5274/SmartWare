package kr.or.ddit.smartware.post.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.post.model.Comments;
import kr.or.ddit.smartware.post.model.Post;
import kr.or.ddit.smartware.post.model.PostFile;

@Repository
public class PostDao implements IPostDao {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Post> getPostList(Map map) {
		return sqlSession.selectList("post.getPostList", map);
	}

	@Override
	public Post selectPost(String post_id) {
		return sqlSession.selectOne("post.selectPost", post_id);
	}

	@Override
	public List<Comments> getCommentsList(String post_id) {
		return sqlSession.selectList("comments.getCommentsList", post_id);
	}
	
	@Override
	public int insertComments(Comments comments) {
		return sqlSession.insert("comments.insertComments", comments);
	}

	@Override
	public int insertPost(Post post) {
		return sqlSession.insert("post.insertPost", post);
	}
	
	@Override
	public int insertPost2(Post post) {
		return sqlSession.insert("post.insertPost2", post);
	}

	@Override
	public int insertPostFile(PostFile postfile) {
		return sqlSession.insert("postfile.insertPostFile", postfile);
	}

	@Override
	public String getPostSeq() {
		return sqlSession.selectOne("post.getPostSeq");
	}

	@Override
	public List<Post> allPostList(String board_id) {
		return sqlSession.selectList("post.allPostList", board_id);
	}

	@Override
	public int deletePost(Post post) {
		return sqlSession.update("post.deletePost", post);
	}

	@Override
	public int updatePost(Post post) {
		return sqlSession.update("post.updatePost", post);
	}

	@Override
	public List<PostFile> getPostFile(String post_id) {
		return sqlSession.selectList("postfile.getPostFile", post_id);
	}

	@Override
	public int deletePostFile(String file_id) {
		return sqlSession.delete("postfile.deletePostFile", file_id);
	}

	@Override
	public int deleteComments(String com_id) {
		return sqlSession.update("comments.deleteComments", com_id);
	}

	@Override
	public PostFile selectPostFile(String file_id) {
		return sqlSession.selectOne("postfile.selectPostFile", file_id);
	}

}
