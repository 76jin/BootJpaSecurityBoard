package kr.ranian.bootBoard.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.ranian.bootBoard.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String> {

}
