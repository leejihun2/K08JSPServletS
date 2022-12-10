package homework.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;
import common.JDBConnectHome;

public class BoardHomeDAO extends JDBConnectHome {
	
	public BoardHomeDAO(ServletContext application) {
		
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) FROM board";
		
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
	
	public List<BoardHomeDTO> selectList(Map<String, Object> map){
		
		List<BoardHomeDTO> bbs = new Vector<BoardHomeDTO>();
		
		String query = "SELECT * FROM board";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		query += " ORDER BY num DESC ";
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				
				BoardHomeDTO dto = new BoardHomeDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
	
				bbs.add(dto);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int insertWrite(BoardHomeDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO board (num,title,content,id,visitcount) VALUES (seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId()); 
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertRegister(BoardHomeDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO member (id,pass,name) VALUES (?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName()); 
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			
			e.printStackTrace();
		}
		return result;
	}
	
	public BoardHomeDTO selectView(String num) {
		
		BoardHomeDTO dto = new BoardHomeDTO();
		
		String query = "SELECT B.*, M.name FROM member M INNER JOIN board B ON M.id=B.id WHERE num=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
			
			if (rs.next()) {
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public void updateVisitCount(String num) {
		
		String query = "UPDATE board SET visitcount=visitcount+1 WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	public int updateEdit(BoardHomeDTO dto) {
		int result = 0;
		
		try {
			
			String query = "UPDATE board SET title=?, content=? WHERE num=?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deletePost (BoardHomeDTO dto) {
		int result = 0;
		
		try {
			
			String query = "DELETE FROM board WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
