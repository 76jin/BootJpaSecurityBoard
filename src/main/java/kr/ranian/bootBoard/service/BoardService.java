package kr.ranian.bootBoard.service;

import java.util.List;

import kr.ranian.bootBoard.entity.Board;

public interface BoardService {
	
	public List<Board> getList();
	public void register(Board vo);
	public Board get(Long idx);
	public void remove(Long idx);

}
