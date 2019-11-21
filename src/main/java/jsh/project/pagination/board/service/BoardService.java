package jsh.project.pagination.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import jsh.project.pagination.board.dao.ArticleRepository;
import jsh.project.pagination.util.Pagination;

@Service
public class BoardService {
	private ArticleRepository articleRepository;
	
	public BoardService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}
	
	public int totalCount() {
		return articleRepository.totalCount();
	}
	
	public Map<String, Object> articleList(int page){
		Map<String, Object> resultMap = new HashMap<>();
		Pagination pagination = new Pagination(totalCount(), page);
		resultMap.put("pagination",pagination); 
		resultMap.put("articleList",articleRepository.list(pagination.scope()));
		return resultMap; 
	}

}
