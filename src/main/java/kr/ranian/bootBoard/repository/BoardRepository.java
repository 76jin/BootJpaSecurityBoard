package kr.ranian.bootBoard.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ranian.bootBoard.entity.Board;

@Repository		// 생략 가능
public interface BoardRepository extends JpaRepository<Board, Long> {

}
