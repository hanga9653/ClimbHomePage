package mo1board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import N1common.JDBConnect;


public class BoardDAO extends JDBConnect {
	
	//DAO클래스의 생성자. 부모클래스의 생성자 호출을 통해 DB에 연결한다. 
    public BoardDAO(ServletContext application) {
        super(application);
    }
    
    /*
    board테이블에 저장된 게시물의 갯수를 카운트하기 위한 메서드.
    카운트 한 결과값을 통해 목록 출력시 게시물의 순번을 출력한다.
    만약 검색어가 있는 경우를 대비해서 Map컬렉션을 매개변수로 선언한다.  
    */
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM multiboard WHERE b_flag='"+map.get("b_flag")+"'";
        if (map.get("searchWord") != null) {
            query += " AND " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);   
            rs.next();   
            totalCount = rs.getInt(1);  
            System.out.println(totalCount);
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount; 
    }
    //목록 출력
    public List<BoardDTO> selectList(Map<String, Object> map) { 
    	
    	List<BoardDTO> bbs = new Vector<BoardDTO>(); 
        String query = "SELECT * FROM multiboard "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {        	
            stmt = con.createStatement();    
            rs = stmt.executeQuery(query);  
            
            while (rs.next()) {
                BoardDTO dto = new BoardDTO(); 
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
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return bbs;
    }
    
    //사용자가 입력한 내용을 board테이블에 입력(insert) 처리한다. 
    public int insertWrite(BoardDTO dto) {
    	//입력결과 확인용 변수
    	int result = 0;
        
        try {
        	//인파라미터가 있는 동적 쿼리문 작성(사용자의 입력에 따라 달라짐)
            String query = "INSERT INTO multiboard ( "
                         + " title, content, id, ofile, sfile, b_flag, visitcount) "
                         + " VALUES ( "
                         + " ?, ?, ?, ?, ?, ?, 0)";  
            //동적쿼리문 실행을 위한 prepared객체 생성
            psmt = con.prepareStatement(query);   
            //인파라미터 설정
            psmt.setString(1, dto.getTitle());  
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getB_flag());//플레그 추가
            //쿼리문실행 : 행에 영향을 미치는 쿼리이므로 executeUpdate()메서드 사용함.
            //	입력에 성공하면 1, 실패하면 0을 반환한다. 
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    //상세보기를 위해 매개변수로 전달된 일련번호에 해당하는 게시물을 인출한다.
    public BoardDTO selectView(String num) { 
        
    	BoardDTO dto = new BoardDTO();
    	
        String query = "SELECT B.*, M.name " 
                     + " FROM climbmember M INNER JOIN multiboard B " 
                     + " ON M.id=B.id "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);   
            rs = psmt.executeQuery();
            if (rs.next()) { 
                dto.setNum(rs.getString(1)); 
                dto.setTitle(rs.getString(2));//인덱스를 통해 값 인출
                dto.setContent(rs.getString("content"));//컬럼명을 통해 값 인출
                dto.setPostdate(rs.getDate("postdate"));//날짜타입이므로 getDate()로 인출
                dto.setId(rs.getString("id"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setVisitcount(rs.getString(8));
                dto.setB_flag(rs.getString("b_flag"));//DTO에 b_flag추가
                dto.setName(rs.getString("name")); 
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return dto; 
    }
    //게시물의 조회수를 1증가 시킨다. 
    public void updateVisitCount(String num) {
        String query = "UPDATE multiboard SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE num=?";
        
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);   
            psmt.executeQuery();   
        } 
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    //게시물 수정하기
    public int updateEdit(BoardDTO dto) { 
        int result = 0;        
        try {
            String query = "UPDATE multiboard SET "
                         + " title=?, content=? "
                         + " WHERE num=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; 
    }
    //게시물 삭제를 위해 delete쿼리문을 실행한다. 
    public int deletePost(BoardDTO dto) { 
        int result = 0;

        try {
            String query = "DELETE FROM multiboard WHERE num=?"; 
            
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 

            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;  
    }
    
    //게시판의 페이징 처리를 위한 메서드
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();  
        
        String query = "SELECT * FROM multiboard WHERE b_flag=? ";
        if(map.get("searchWord") != null) {
           query += " AND " + map.get("searchField")
                 + "   LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC LIMIT ?, ? ";
        	
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("b_flag").toString());
            psmt.setInt(2, Integer.parseInt(map.get("start").toString()));
            psmt.setInt(3, Integer.parseInt(map.get("end").toString()));

            rs = psmt.executeQuery();
            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setB_flag(rs.getString("b_flag"));

                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        return bbs;
    }
    
    public List<BoardDTO> selectList(){
    	List<BoardDTO> nobo = new Vector<BoardDTO>();
    	String query = "SELECT * FROM multiboard "
    			+ " WHERE b_flag='notice' "
    			+ " ORDER BY postdate DESC LIMIT 5";
    	try {
    		stmt = con.createStatement();
    		rs = stmt.executeQuery(query);
    		
    		while(rs.next()) {
    			BoardDTO dto = new BoardDTO();
    			
    			dto.setNum(rs.getString("num"));
    			dto.setTitle(rs.getString("title"));
    			dto.setB_flag(rs.getString("b_flag"));
    			
    			 nobo.add(dto);
    		}
    	}
    	catch (Exception e) {
    		System.out.println("조회중 예외발생");
    		e.printStackTrace();
    	}
    	return nobo;
    }
    
}