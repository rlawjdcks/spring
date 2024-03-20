package driver;

import java.util.List;

import dao.BoardDao;
import dto.Board;

public class DaoEx1 {

	public static void main(String[] args) {
		BoardDao dao = BoardDao.getInstance();
		List<Board> list = dao.selectList();
		
		//람다식
		list.stream().forEach(s ->{
			System.out.println(s.getWriter());
		});
		
//		System.out.println(list);
//		
//		for (Board board : list) {
//			System.out.println(board);
//			
//		}
	}

}
