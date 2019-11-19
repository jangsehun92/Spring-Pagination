package jsh.project.pagination.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jsh.project.pagination.board.dao.ArticleRepository;
import jsh.project.pagination.board.dto.Article;

@Service
public class BoardService {
	
	private ArticleRepository articleRepository;
	
	public BoardService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}
	
	public int totalCount() {
		return articleRepository.totalCount();
	}
	
	public List<Article> articleList(int countList, int page){
		return articleRepository.list(page); 
	}

}
