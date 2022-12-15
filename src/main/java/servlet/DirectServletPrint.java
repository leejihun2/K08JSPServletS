package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 생성을 위해 첫 번째로 HttpServlet클래스를 상속한다.
public class DirectServletPrint extends HttpServlet{
	
	/*
	사용자가 post방식으로 전송한 요청을 처리하기 위해 doPost() 메서드를
 	오버라이딩 한다. 만약 해당 메서드가 오버라이딩 되지 않으면 요청을
 	처리할 메서드가 없으므로 405에러가 발생하게된다.
 	*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		/* 서블릿에서 직접 HTML태그를 출력하기 위해 문서의 컨텐츠타입을
		설정한다. */
		resp.setContentType("text/html;charset=UTF-8");
		//직접 출력을 위해 PrintWriter 객체를 생성한다.
		PrintWriter writer = resp.getWriter();
		//출력할 내용을 기술한다.
		writer.println("<html>");
		writer.println("<head><title>DirectServletPrint.jsp</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력합니다</h2>");
		writer.println("<p>jsp로 포워드하지 않습니다.</p>");
		writer.println("</body>");
		writer.println("</html>");
		//객체의 자원을 해제한다.
		writer.close();
		/*
		이 방식은 JSP페이지 없이 서블릿에서 직접 내용을 출력해야할때
		사용한다. API통신시 주로 사용하게된다. 
		*/
	}
}
/*
HttpServlet의 주요 메서드는 doGet(), doPost(), doDelete(), doHead(), service() 등이 있다. 
do로 시작하는 메서드들은 모두 접근 지정자가 protected이다.

service() 메서드는 접근 지정자가 public이냐 protected이냐에 따라 기능이 조금 다른데, 
public인 경우 클라이언트의 request를 protected service()에 전달하고 
protected인 겨우 request를 public service()에서 
전달받아 do로 시작하는 메서드를 호출한다.
*/
	
	
