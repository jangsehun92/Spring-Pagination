package jsh.project.pagination.board.controller;

import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jsh.project.pagination.board.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "redirect:/articles";
	}
	
	@RequestMapping(value = "/articles", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required = false, defaultValue = "1")int page) {
		logger.info("요청한 게시판 페이지 : "+page);
		Map<String, Object> resultMap = boardService.articleList(page);
		model.addAttribute("resultMap", resultMap);
		return "list";
	}
}
