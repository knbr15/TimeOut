package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.*;
import java.util.*;
import java.text.SimpleDateFormat;

//�׼�Ŭ����->������(��Ʈ�ѷ�)
// /list.do=action.ListAction
public class ListAction2 implements CommandAction {

	//�۸�Ϻ���
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//1. JSP���� ó���� �ڹ��ڵ�(��1)->�׼�Ŭ������ �̵�(��2)
		//<% @ page import="kdh.board.*,java.util.*,java.text.SimpleDateFormat" %>	
		int pageSize=10;//numPerPage
		int blockSize=10;//pagePerBlock
		
		//�Խ����� �� ó�� �����Ű�� ������ 1���������� ���
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){//�� ó�� ������ ���̶��
			pageNum="1";//default�� ����
		}
		int currentPage=Integer.parseInt(pageNum);//nowPage(����������)
		//ȭ�鿡 ��� -> ���۷��ڵ��ȣ -> limit ?,?
		int startRow=(currentPage-1)*pageSize+1;//�������� ���� ���ڵ��ȣ
		int endRow=currentPage*pageSize;//�������� ������ ���ڵ��ȣ
		int count=0;//�� ���ڵ� ��
		int number=0;//beginPerPage -> �������� ���� ���� ������ �Խù���ȣ
		List articleList=null;//ȭ�鿡 ����� ���ڵ� ��ü(�÷��� ��ü)
		
		ArticleDAO dbPro=new ArticleDAO();
		count=dbPro.getArticleCount();//��ü ���ڵ�� count(*)
		System.out.println("���� ���ڵ��(count)="+count);
		if(count>0){//ȭ�鿡 ������ ���ڵ���� �ϳ��� �����Ѵٸ�
			articleList=dbPro.getArticles(startRow,pageSize);
		} else {
			articleList=Collections.EMPTY_LIST;//�ƹ��͵� ���ٴ� ǥ��(���)
		}
		number=count-(currentPage-1)*pageSize;// �������� ���� ���� ������ �Խù���ȣ
		System.out.println("�������� number=>"+number);
		
		//2. �̵��ϴ� �������� �Ѿ�� ���� request��ü�� �̿��Ͽ� �޸𸮿� ����
		//int currentPage=(Integer)request.getAttribute("currentPage")->${currentPage}
		request.setAttribute("currentPage", currentPage);//key���� value���� ���� �ָ� EL���� ����ϱ� ��
		request.setAttribute("startRow", startRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("number", number);
		request.setAttribute("articleList", articleList);
		
		//3. �̵��ϴ� �������� forward(����)
		return "/list.jsp"; //view=com.requestPro(request,response);
	}

}
 