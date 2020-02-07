package annotation;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class PrintAnnotationMain {

	public static void main(String[] args) {
	//Service 클래스로부터 메서드 정보를 열어옮
	Method[] methods =	Service.class.getDeclaredMethods();	
//	System.out.println(methods.length);
	for(Method method : methods) {
		//PrintAnnotation이 적용되었는지 여부를 확인
		if(method.isAnnotationPresent(PrintAnnotation.class)) {
			//PrintAnnotation 객체 열기
			PrintAnnotation printAnnotation
				= method.getAnnotation(PrintAnnotation.class);
			//메서드 이름 출력
			System.out.println("[" + method.getName() + "]");
			
			//구분선 출력
			for(int i=0; i<printAnnotation.number(); i++) {
				System.out.print(printAnnotation.value());
			}
			System.out.println();
			
			//메서드 호출
			try {
				method.invoke(new Service());
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				e.printStackTrace();
			}
			//구분선 출력
			for(int i=0; i<printAnnotation.number(); i++) {
				System.out.print(printAnnotation.value());
			}
			System.out.println();
			
		};
	 }

	}

}
