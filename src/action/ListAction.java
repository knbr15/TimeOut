package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.*;
import java.util.*;
import java.text.SimpleDateFormat;

//액션클래스->스프링(컨트롤러)
// /list.do=action.ListAction
public class ListAction implements CommandAction {

	//글목록보기 + 검색창
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String pageNum=request.getParameter("pageNum");
		//매개변수 추가(검색분야, 검색어)
		String search=request.getParameter("search");
		String searchtext=request.getParameter("searchtext");
		
		int count=0;//총 레코드수
		List articleList=null;//화면에 출력할 레코드 전체(컬렉션 객체)
		
		ArticleDAO dbPro=new ArticleDAO();
		count=dbPro.getArticleSearchCount(search,searchtext);//전체 레코드수 count(*)
		System.out.println("현재 레코드수(count)="+count);
		//pageNum,count -> pageList메서드 전달
		Hashtable<String,Integer> pgList=dbPro.pageList(pageNum, count);
		
		if(count>0){//화면에 보여줄 레코드수가 하나라도 존재한다면
			System.out.println(pgList.get("startRow")+","+pgList.get("endRow"));
			articleList=dbPro.getBoardArticles(pgList.get("startRow"),pgList.get("pageSize"),search,searchtext);
		} else {
			articleList=Collections.EMPTY_LIST;//아무것도 없다는 표시(상수)
		}
		
		request.setAttribute("search", search);
		request.setAttribute("searchtext", searchtext);
		request.setAttribute("pgList", pgList);//페이징처리 정보 10개가 들어가 있는 컬렉션
		request.setAttribute("articleList", articleList);
		
		return "/list.jsp"; //view=com.requestPro(request,response);
	}

}
 