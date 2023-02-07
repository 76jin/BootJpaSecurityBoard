package kr.ranian.bootBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ranian.bootBoard.entity.Board;
import kr.ranian.bootBoard.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Board> list = boardService.getList();
		
		model.addAttribute("list", list);
		return "list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@PostMapping("/register")
	public String registerPost(Board vo) {
		boardService.register(vo);
		return "redirect:/list";
	}

}