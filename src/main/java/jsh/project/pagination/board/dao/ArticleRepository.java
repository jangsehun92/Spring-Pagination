package jsh.project.pagination.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jsh.project.pagination.board.dto.Article;

@Repository
public class ArticleRepository {
	
	private SqlSession sqlSession;
	
	public ArticleRepository(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int totalCount() {
		return 0;
	}
	
	public List<Article> list(int page){
		return null;
	}

}
