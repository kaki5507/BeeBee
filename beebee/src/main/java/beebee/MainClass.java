package beebee;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
	
	public static void main(String[] args) {
//		TransportationWalk transportationWalk = new TransportationWalk();
//		transportationWalk.move(); 
		/* resources 필요한 자원들 보관 applicationContext는 메모리 생성될때 ioc라는 큰 그릇을 하나 만드는데
		 내가 필요한 객체를 생성하고 필요할때 마다 그릇에서 꺼내서 사용 그 객체를 만들어주는 곳이 app~.xml
		*/
		
		// 스프링 컨테이너에 먼저 접근
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
		
		TransportationWalk transportationWalk = ctx.getBean("tWalk", TransportationWalk.class);
		transportationWalk.move();
		
		ctx.close();
	}
}
