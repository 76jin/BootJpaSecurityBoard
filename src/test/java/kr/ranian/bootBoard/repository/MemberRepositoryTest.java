package kr.ranian.bootBoard.repository;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.ranian.bootBoard.entity.Member;
import kr.ranian.bootBoard.entity.Role;

@SpringBootTest
public class MemberRepositoryTest {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Test
	public void createMember() {
		Member member = new Member();
		member.setUsername("test01");
		member.setPassword(passwordEncoder.encode("test01"));	// 암호화
		member.setName("관리자");
		member.setRole(Role.ADMIN);
		member.setEnabled(true);
		memberRepository.save(member);	// 회원가입
	}
	
	@Test
	public void createMemberManager() {
		Member member = new Member();
		member.setUsername("test02");
		member.setPassword(passwordEncoder.encode("test02"));	// 암호화
		member.setName("매니저");
		member.setRole(Role.MANAGER);
		member.setEnabled(true);
		memberRepository.save(member);	// 회원가입
	}

}