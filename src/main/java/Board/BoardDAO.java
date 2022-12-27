package Board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import N1common.DBConnPool;

public class BoardDAO extends DBConnPool{
	
	public BoardDAO() {
		super();
	}
	public BoardDAO(ServletContext application) {
		super(application);
	}
	//게시물 갯수 카운트
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM pre";
		if(map.get("searchWord")!=null) {
			query += " WHERE "+ map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	 //조건에 맞는 게시물을 목록에 출력하기 위한 쿼리문을 실행한다.
	   public List<BoardDTO> selectListPage(Map<String, Object> map) {
	      List<BoardDTO> board = new Vector<BoardDTO>();
	      
	      String query = "SELECT * FROM pre ";
	      
	      if (map.get("searchWord") != null) {
	         query += " WHERE " + map.get("searchField") + " "
	               + " LIKE '%" + map.get("searchWord") + "%'";
	      }
	      query += " ORDER BY num DESC LIMIT ?, ?";
	            
	      
	      try {
	         psmt = con.prepareStatement(query);
	         psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
	         psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            BoardDTO dto = new BoardDTO();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setTitle(rs.getString("title"));
	       	    dto.setContent(rs.getString("content")); 
	       	    dto.setId(rs.getString("id"));
	       	    dto.setOfile(rs.getString("ofile")); 
	       	    dto.setSfile(rs.getString("sfile"));
	       	    dto.setPostdate(rs.getDate("postdate"));
	       	    dto.setVisitcount(rs.getInt("visitcount"));
	            //List컬렉션에 DTO객체를 추가한다. 
	            board.add(dto);
	         }

	      } 
	      catch (Exception e) {
	         System.out.println("게시물 조회 중 예외 발생");
	         e.printStackTrace();
	      }
	      
	      return board;
	   }
	   
   
   //작성하기
   public int insertWrite(BoardDTO dto) {
	   int result = 0;
	   try { 
		   String query = "INSERT INTO pre ( "
				   + " id, title, content, ofile, sfile) "
				   + " VALUES ( "
				   + " ?, ?, ?, ?, ?)";
		   
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, dto.getId());
		   psmt.setString(2, dto.getTitle());
		   psmt.setString(3, dto.getContent());
		   psmt.setString(4, dto.getOfile());
		   psmt.setString(5, dto.getSfile());
		   
		   result = psmt.executeUpdate();
	   }
	   catch (Exception e) {
		   System.out.println("게시물 입력 중 예외 발생");
		   e.printStackTrace();
	   }
	   return result;
   }
   
   //게시물 내용보기
   public BoardDTO selectView(String num) {
	   BoardDTO dto = new BoardDTO();
	   String query = "SELECT * FROM pre WHERE num=?";
	   try {
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, num);
		   rs = psmt.executeQuery();
		   if(rs.next()) {
			   dto.setNum(rs.getString(1));
			   dto.setId(rs.getString("id"));
			   dto.setTitle(rs.getString("title"));
			   dto.setContent(rs.getString("content"));
			   dto.setOfile(rs.getString("ofile"));
			   dto.setSfile(rs.getString("sfile"));
			   dto.setVisitcount(rs.getInt("visitcount"));
			   dto.setPostdate(rs.getDate("postdate"));
		   }
	   }
	   catch (Exception e) {
		   System.out.println("게시물 상세보기 중 예외 발생");
		   e.printStackTrace();
	   }
	   return dto;
   }
   
   //게시물의 조회수증가
   public void updateVisitCount(String num) {
	   String query = "UPDATE pre SET "
			   + " visitcount=visitcount+1 "
			   + " WHERE num=?";
	   try {
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, num);
		   psmt.executeQuery();
	   }
	   catch (Exception e) {
		   System.out.println("게시물 조회수 증가중 예외발생");
		   e.printStackTrace();
	   }
   }
   
   public int deletePost(String num) {
	   int result = 0;
	   try {
		   String query = "DELETE FROM pre WHERE num=?";
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, num);
		   result = psmt.executeUpdate();
		   
		   
	   }
	   catch (Exception e) {
		   System.out.println("게시물 삭제 중 예외 발생");
		   e.printStackTrace();
	   }
	   return result;
   }
   
   //게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다.
   //(파일 업로드 지원)
   public int updatePost(BoardDTO dto) {
	   int result = 0;
	   try {
		   //쿼리문 템플릿 준비
	       //일련번호와 패스워드까지 where절에 추가항 둘 다 일치할 때만
	       //수정처리된다.
		   String query = "UPDATE pre"
				   + " SET title=?, content=?, ofile=?, sfile=? "
				   + " WHERE num=?";
		   
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, dto.getTitle());
		   psmt.setString(2, dto.getContent());
		   psmt.setString(3, dto.getOfile());
		   psmt.setString(4, dto.getSfile());
		   psmt.setString(5, dto.getNum());
		   
		   result = psmt.executeUpdate();
	   }
	   catch (Exception e) {
		   System.out.println("게시물 수정 중 예외 발생");
		   e.printStackTrace();
	   }
	   return result;
   }
   
 //패스워드 검증을 위한 메서드로 조건에 맞는 게시물을 카운트한다.
   public boolean confirmPassword(String num) {
	   boolean isCorr = true;
	   try {
		   //일련번화와 패스워드가 일치하는 게시물이 있는지 확인한다.
		   String sql = "SELECT COUNT(*) FROM pre WHERE num=?";
		   psmt = con.prepareStatement(sql);
		   psmt.setString(1, num);
		   rs = psmt.executeQuery();
		   //count()함수의 경우 조건에 맞는 레코드가 없으면 0을 반환하므로
		   //어떤 경우에도 결과값이 있다. 따라서 next()를 단독으로 실행한다.
		   rs.next();
		   if(rs.getInt(1)==0) {
			   isCorr = false;
		   }
	   }
	   catch (Exception e) {
		   isCorr = false;
		   e.printStackTrace();
	   }
	   return isCorr;
   }
}
