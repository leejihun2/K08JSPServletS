package library.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnectCol;
import model1.board.BoardDTO;

public class LibraryDAO extends JDBConnectCol {
	
	public LibraryDAO() {
		
	}
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) FROM LIBRARY";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	public List<LibraryDTO> selectList(Map<String, Object> map){
		
		List<LibraryDTO> bbs = new Vector<LibraryDTO>();
		
		System.out.println("=========selectList 쿼리 실행============");
		
		String query = "SELECT * FROM library";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		query += " ORDER BY book_code DESC ";
		
		System.out.println(query);
		
		try {
			System.out.println("==========selectList statement 준비=================");
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("rs : " + rs.toString());
			System.out.println(query);
			
			while (rs.next()) {
				
				System.out.println("================================");
				LibraryDTO dto = new LibraryDTO();
				
				dto.setCode(rs.getString("book_code"));
				dto.setTitle(rs.getString("book_title"));
				dto.setGenre(rs.getString("book_genre"));
				dto.setAuthor(rs.getString("book_author"));
				dto.setStatus(rs.getString("book_status"));
	
				bbs.add(dto);
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO library (book_code, book_genre, book_title, book_author) VALUES (?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.toString());
			psmt.setString(2, dto.toString());
			psmt.setString(3, dto.toString());
			psmt.setString(4, dto.toString());
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			
			e.printStackTrace();
		}
		return result;
	}
	

}
