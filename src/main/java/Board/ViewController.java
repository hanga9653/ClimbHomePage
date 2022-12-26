package Board;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gallclimb/View.do")
public class ViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		String num = req.getParameter("num");
		dao.updateVisitCount(num);
		BoardDTO dto = dao.selectView(num);
		dao.close();
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		
		String ext = null, fileName = dto.getSfile();
		if(fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mineStr = {"png", "jpg", "gif"};
		List<String> mimeList = Arrays.asList(mineStr);
		boolean isImage = false;
		if(mimeList.contains(ext)) {
			isImage = true;
		}
		req.setAttribute("isImage", isImage);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Main/View.jsp").forward(req, resp);
	}
}
