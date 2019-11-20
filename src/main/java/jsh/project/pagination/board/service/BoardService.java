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
		Map<String, Integer> paramMap = new HashMap<>();
		Map<String, Object> resultMap = new HashMap<>();
		int totalCount = totalCount(); //게시판의 총 게시글의 수
		Pagination pagination = new Pagination(totalCount, page);
		paramMap.put("countList", pagination.getCountList());
		paramMap.put("page", page);
		
		resultMap.put("pagination",pagination);
		resultMap.put("articleList",articleRepository.list(paramMap));
		return resultMap; 
	}

}
