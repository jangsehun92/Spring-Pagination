package jsh.project.pagination.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jsh.project.pagination.board.dto.Article;
import jsh.project.pagination.board.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private BoardService boardService;
	
	@RequestMapping(value = "/articles", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required = false, defaultValue = "1")int page) {
									//사용자가 처음 게시판에 들어올때 page값을 요청하지 않게 만들었기때문에, required=false로 하고 
									//요청에 page값이 없으면 기본값은 1로 설정해준다.
		
		//게시판의 총 게시글 수를 가져온다.(페이징처리를 위해)
		int totalCount = boardService.totalCount(); 
		
		List<Article> articleList = boardService.articleList(10,page);
		
		model.addAttribute("articleList", articleList);
		return "list";
	}
}
