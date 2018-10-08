package controller;

import java.io.*;//FileInputStream
import java.util.*;//Map,Properties
import javax.servlet.*;
import javax.servlet.http.*;

import action.CommandAction;

public class ControllerAction extends HttpServlet {
	
    //명령어와 명령어 처리클래스를 쌍으로 저장
    private Map commandMap = new HashMap();
    
	//서블릿을 실행시 서블릿의 초기화 작업->생성자 역할
    public void init(ServletConfig config) throws ServletException {
    						//->매개변수로 ServletConfig객체를 받음
    //web.xml의 propertyConfig를 매개변수로 받아 경로에 맞는 CommandPro.properties파일 불러옴
    String props = config.getInitParameter("propertyConfig");
    System.out.println("불러온경로="+props);
    
    //명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성 -> 파일을 불러와 메모리에 올림
    Properties pr = new Properties();
    FileInputStream f = null;//파일불러올때 
    
        try {
           //CommandPro.properties파일의 내용을 읽어옴
        	f=new FileInputStream(props);
           
        	//파일의 정보를 Properties에 저장
        	pr.load(f);
        	
        } catch (IOException e) {
        	throw new ServletException(e);
        } finally {
        	if(f!=null) try{f.close();}catch(IOException ex){}	
        }
        	
     //객체를 하나씩 꺼내서 그 객체명으로 Properties
     //객체에 저장된 객체를 접근
     Iterator keyiter = pr.keySet().iterator();
     
     while(keyiter.hasNext()){
       //요청한 명령어를 구하기위해
       String command = (String)keyiter.next();
       System.out.println("command="+command);
       //요청한 명령어(키)에 해당하는 클래스명을 구함
       String className=pr.getProperty(command);
       System.out.println("className="+className);//명령어처리클래스
       
       try{
       //그 클래스의 객체를 얻어오기위해 메모리에 로드
       Class commandClass = Class.forName(className);//action.ListAction
       System.out.println("commandClass="+commandClass);
       Object commandInstance = commandClass.newInstance();//객체생성
       System.out.println("commandInstance="+commandInstance);
      
       //Map객체 commandMap에 저장
       commandMap.put(command, commandInstance);
       System.out.println("commandMap="+commandMap);
       
            } catch (ClassNotFoundException e) {
                throw new ServletException(e);
            } catch (InstantiationException e) {
                throw new ServletException(e);
            } catch (IllegalAccessException e) {
                throw new ServletException(e);
            }
        }//while
    }

    public void doGet(//get방식의 서비스 메소드->글쓰기폼, 글수정폼, 글삭제폼
                     HttpServletRequest request, 
                     HttpServletResponse response)
    throws ServletException, IOException {
    	    requestPro(request,response);
    }

    protected void doPost(//post방식의 서비스 메소드->글쓰기, 글수정
                     HttpServletRequest request, 
                     HttpServletResponse response)
    throws ServletException, IOException {
    	    requestPro(request,response);
    }

    //get방식이든, post방식이든 같은 메서드로 처리 -> 시용자의 요청을 분석해서 해당 작업을 처리
    private void requestPro(HttpServletRequest request,HttpServletResponse response) 
    throws ServletException, IOException {
    	String view=null;//요청명령어에 따라서 이동할 페이지 이름 저장
    	// /list.do=action.ListAction객체를 얻어와서 메서드 호출
    	//ListAction com=null; WriterFormAction com=null; ,,,,
    	CommandAction com=null;//인터페이스 객체형->자동형변환으로 객체 받아오기 위해(요청하는 클래스마다 객체를 생성하면 비효율적이기 때문)
    	try {
    		String command=request.getRequestURI();
    		System.out.println("request.getRequestURI()=>"+request.getRequestURI());// /JspBoard2/list.do
    		//요청명령어와 프로젝트 사이의 일치하는 위치를 얻기 위해서
    		System.out.println("request.getContextPath()=>"+request.getContextPath());// /JspBoard2
    		if(command.indexOf(request.getContextPath())==0) {
    			command=command.substring(request.getContextPath().length());
    			System.out.println("실질적인 요청명령어(command)=>"+command);
    		}
    		//찾은 명령어에 해당하는 객체를 꺼내오는 작업
    		com=(CommandAction)commandMap.get(command);
    		//com=(ListAction)commandMap.get(command);
    		System.out.println("com=>"+com);//action.ListAction@주소값
    		view=com.requestPro(request, response);//ListAction
    	} catch (Throwable e) {//Exception 상위 클래스
    		throw new ServletException(e);
    	}
    	//위에서 요청명령어에 해당하는 view->이동하라
    	RequestDispatcher dispatcher=request.getRequestDispatcher(view);
    	dispatcher.forward(request, response);//데이터를 공유하면서 /list.jsp로 이동
    }
}

