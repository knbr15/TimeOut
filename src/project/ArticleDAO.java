package project;

import java.sql.*;
import java.util.*;

import project.ArticleDTO; 

public class ArticleDAO {

	private DBConnectionMgr pool=null; 
	
	public ArticleDAO() {
		try {
			pool=DBConnectionMgr.getInstance();
			System.out.println("pool=>"+pool);
		} catch(Exception e) {
			System.out.println("ArticleDAO Error접속 오류=>"+e);
		}
	}
	
	public int getArticleCount() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=0;
		
		try {
			conn=pool.getConnection();
			System.out.println("conn=>"+conn);
			String sql="select count(*) from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);//필드명이 없는 경우(그룹함수) -> 인덱스번호로 불러옴
			}
		} catch(Exception e) {
			System.out.println("getArticleCount()메서드 에러 유발=>"+e);
		} finally {
			pool.freeConnection(conn,pstmt,rs);
		}
		return x;
	}
	
	public List getArticles(int start,int end) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List articleList=null;//ArrayList articlelist=null;로 작성해도 됨
		
		try {
			conn=pool.getConnection();
			System.out.println("conn=>"+conn);
			String sql="select * from board order by ref desc, re_step asc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);//MySQL은 레코드 순번이 내부적으로 0부터 시작
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			if(rs.next()) {                     //end 갯수만큼 메모리 영역 사용
				articleList=new ArrayList(end); //List는 인터페이스라 객체 생성 불가->자식클래스(ArrayList)를 통해 생성 가능
				do { //조건식이 거짓이라도 한 번은 무조건 수행 -> 기존에 있는 것에 누적해서 출력
					ArticleDTO article=makeArticleFromResult(rs);
					/*article=new BoardDTO();
					article.setNum(rs.getInt("num"));//최대값+1
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));//작성일 -> now()
					article.setReadcount(rs.getInt("readcount"));//default->0
					article.setRef(rs.getInt("ref"));//그룹번호
					article.setRe_step(rs.getInt("re_step"));//답변글  순서
					article.setRe_level(rs.getInt("re_level"));//답변의 depth
					article.setContent(rs.getString("content"));//글 내용
					article.setIp(rs.getString("ip"));//작성자의 원격ip주소 -> request.getRemoteAddr();*/	
				    //추가
					articleList.add(article);
				} while (rs.next());
			}
		} catch(Exception e) {
			System.out.println("getArticles()메서드 에러 유발=>"+e);
		} finally {
			pool.freeConnection(conn,pstmt,rs);
		}
		return articleList;
	}
	private ArticleDTO makeArticleFromResult(ResultSet rs) throws SQLException { //현재 해당 클래스 내부에서만 사용하는 경우 private 지정
		ArticleDTO article=new ArticleDTO();
		article.setNum(rs.getInt("num"));
		article.setWriter(rs.getString("writer"));
		article.setTitle(rs.getString("title"));
		article.setPasswd(rs.getString("passwd"));
		article.setReg_date(rs.getTimestamp("reg_date"));//작성일 -> now()
		article.setContent(rs.getString("content"));//글 내용
		article.setIp(rs.getString("ip"));
		return article;
	}
	
	public int getArticleSearchCount(String search, String searchtext) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int x=0;
		
		try {
			conn=pool.getConnection();
			System.out.println("conn=>"+conn);
			//------------------------------------------------------------------------
			//검색분야 선택하지 않았거나 검색어를 입력하지 않은 경우
			if(search==null || searchtext=="") {
				sql="select count(*) from board";
			} else { //검색분야
				if(search.equals("subject_content")) {//제목+본문
					sql="select count(*) from board where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%'";
				} else { //제목,작성자 -> 매개변수를 이용해서 하나의 sql 통합
					sql="select count(*) from board where "+search+" like '%"+searchtext+"%' ";
				}
			}
			System.out.println("getArticleSearchCount검색어 sql=>"+sql);
			//------------------------------------------------------------------------
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);//필드명이 없는 경우(그룹함수) -> 인덱스번호로 불러옴
			}
		} catch(Exception e) {
			System.out.println("getArticleSearchCount()메서드 에러 유발=>"+e);
		} finally {
			pool.freeConnection(conn,pstmt,rs);
		}
		return x;
	}
	
	public Hashtable pageList(String pageNum,int count) {
		//페이징 처리결과를 저장할 hashtable 객체 선언
		Hashtable<String,Integer> pgList=new Hashtable<String,Integer>();
		//---------------------------ListAction.java------------------------------
		int pageSize=10;//numPerPage
		int blockSize=10;//pagePerBlock	
		//String pageNum=request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage=Integer.parseInt(pageNum);//nowPage(현재페이지)
		int startRow=(currentPage-1)*pageSize+1;//페이지당 시작 레코드번호
		int endRow=currentPage*pageSize;//페이지당 마지막 레코드번호
		//int count=0;//총 레코드 수
		int number=0;//beginPerPage -> 페이지별 가장 위에 나오는 게시물번호
		System.out.println("현재 레코드수(count)=>"+count);
		number=count-(currentPage-1)*pageSize;
		System.out.println("페이지별 number=>"+number);
		//-------------------------- 모델1 list.jsp -------------------------------
		int pageCount=count/pageSize+(count%pageSize==0?0:1); //총 페이지수
		System.out.println("pageCount="+pageCount);
		int startPage=currentPage-((currentPage-1)%blockSize);
		int endPage=startPage+blockSize-1;
		System.out.println("startPage="+startPage+", endPage="+endPage);
		if(endPage>pageCount) endPage=pageCount;//마지막 페이지=총 페이지
		//------------------------------------------------------------------------
		//ListAction(pageNum,count) => 처리결과 => ListAction전달 -> request -> 
		pgList.put("pageSize", pageSize);
		pgList.put("blockSize", blockSize);
		pgList.put("currentPage", currentPage);
		pgList.put("startRow", startRow);
		pgList.put("endRow", endRow);//필요없음
		pgList.put("count", count);
		pgList.put("number", number);
		pgList.put("startPage", startPage);
		pgList.put("endPage", endPage);
		pgList.put("pageCount", pageCount);
		return pgList;
	}
	
	public List getBoardArticles(int start,int end,String search,String searchtext) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List articleList=null;//ArrayList articlelist=null;로 작성해도 됨
		String sql="";
		
		try {
			conn=pool.getConnection();
			System.out.println("conn=>"+conn);
			//--------------------------------------------------------------------------------------
			if(search==null || search=="") {
				sql="select * from board order by ref desc, re_step asc limit ?,?";
			} else {
					if(search.equals("subject_content")) {//제목+본문
						sql="select * from board where subject like '%"+searchtext+"%' or content like '%"+searchtext+"%' order by ref desc, re_step asc limit ?,?";
					} else { //제목,작성자 -> 매개변수를 이용해서 하나의 sql 통합
						sql="select * from board where "+search+" like '%"+searchtext+"%' order by ref desc, re_step asc limit ?,?";
					}
			}
			System.out.println("getBoardArticles()의 sql=>"+sql);
			//--------------------------------------------------------------------------------------
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start-1);//MySQL은 레코드 순번이 내부적으로 0부터 시작
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			if(rs.next()) {                     //end 갯수만큼 메모리 영역 사용
				articleList=new ArrayList(end); //List는 인터페이스라 객체 생성 불가->자식클래스(ArrayList)를 통해 생성 가능
				do { //조건식이 거짓이라도 한 번은 무조건 수행 -> 기존에 있는 것에 누적해서 출력
					ArticleDTO article=makeArticleFromResult(rs);
					articleList.add(article);
				} while (rs.next());
			}
		} catch(Exception e) {
			System.out.println("getBoardArticles()메서드 에러 유발=>"+e);
		} finally {
			pool.freeConnection(conn,pstmt,rs);
		}
		return articleList;
	}

} 
