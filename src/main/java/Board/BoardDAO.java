package Board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import N1common.DBConnPool;

public class BoardDAO extends DBConnPool{
	
	public BoardDAO() {
		super();
	}
	
	//게시물 갯수 카운트
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM multiboard";
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
      
      String query = "SELECT * FROM multiboard ";
      
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
            
            dto.setNum(rs.getString(1));
            dto.setTitle(rs.getString(2));
            dto.setContent(rs.getString(3));
            dto.setId(rs.getString(4));
            dto.setOfile(rs.getString(5));
            dto.setSfile(rs.getString(6));
            dto.setPostdate(rs.getDate(7));
            dto.setVisitcount(rs.getString(8));
            dto.setB_flag(rs.getString(9));
            
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
}
