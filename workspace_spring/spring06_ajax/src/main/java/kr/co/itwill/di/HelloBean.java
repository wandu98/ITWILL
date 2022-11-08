package kr.co.itwill.di;



import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;


public class HelloBean {

	public static void main(String[] args) {
		//스프링 빈
		
		Resource resource = new ClassPathResource("springbean.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		
		IHello hello = null;
		hello = (IHello) factory.getBean("msgKO");
		hello.sayHello("김연아");
		
		hello = (IHello) factory.getBean("msgEN");
		hello.sayHello("Jane");
		
		
	}//main() end
}//class end
