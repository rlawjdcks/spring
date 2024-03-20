package driver;

import dao.MemberDao;
import dto.Member;

public class MemberDaoEx {

	public static void main(String[] args) {
		MemberDao memberDao = MemberDao.getInstance();
		Member member = memberDao.select("admin");
		System.out.println(member.getId());
		
//		Member member2 = memberDao.selectForLogin("1", "1@1.com");
//		System.out.println(member2);
		
		
//	이미넣음	Member member3 = new Member("abc", "abc@naver.com", "abc이름");
//		memberDao.insert(member3);
		
//		Member member4 = new Member("abc", "abcd@naver.com", "abcd이름");
//		memberDao.update(member4);
	} 

}
