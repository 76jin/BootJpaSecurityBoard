package kr.ranian.bootBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ranian.bootBoard.entity.Board;
import kr.ranian.bootBoard.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Board> list = boardService.getList();
		
		model.addAttribute("list", list);
		return "board/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@PostMapping("/register")
	public String registerPost(Board vo) {
		boardService.register(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public @ResponseBody Board get(Long idx) {
		Board board = boardService.get(idx);
		return board;
	}
	
	@GetMapping("/remove")
	public String remove(Long idx) {
		boardService.remove(idx);
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify (Board vo) {
		boardService.modify(vo);
		return "redirect:/board/list";
	}

}
