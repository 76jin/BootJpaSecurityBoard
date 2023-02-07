package kr.ranian.bootBoard.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ranian.bootBoard.entity.Board;
import kr.ranian.bootBoard.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardRepository boardRepository;

	@Override
	public List<Board> getList() {
		List<Board> list = boardRepository.findAll();
		return list;
	}

	@Override
	public void register(Board vo) {
		boardRepository.save(vo);
	}

	@Override
	public Board get(Long idx) {
		return boardRepository.findById(idx).get();
	}

	@Override
	public void remove(Long idx) {
		boardRepository.deleteById(idx);
	}

}
