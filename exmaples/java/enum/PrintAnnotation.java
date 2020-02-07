package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface PrintAnnotation {
	String value() default "-";	// 디폴트 엘리먼트 : 엘리먼트 이름이 없더라도 값을 부여
	int number() default 15;    // 엘리먼트 값을 주지 않을 때 디폴트 값 = 15
	
}
