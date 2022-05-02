package com.yedam.myserver;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.yedam.myserver.emp.vo.Employee;

public class RestTemplateTest {

	@Test
	public void exchangeText() {
		String url = "http://localhost/myserver/empInsertJson";
		/*
		 * Employee params = new Employee(); params.setEmployee_id(4000);
		 * params.setFirst_name("테스트"); params.setLast_name("리");
		 * params.setEmail("a@a.z"); params.setHire_date(new Date());
		 * params.setJob_id("IT_PROG");
		 */
		Map<String, String> param = new HashMap<String, String>();		
		param.put("employee_id", "5000");
		param.put("first_name", "이유");
		param.put("last_name", "아");
		param.put("email", "nnnn@a.z");
		param.put("hire_date", "2000-12-11");
		param.put("job_id", "IT_PROG");
		
		//header 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<Map<String, String>> request = new HttpEntity<>(param, headers);
		ResponseEntity<Employee> result = new RestTemplate().exchange(url, HttpMethod.POST, request, Employee.class);
		
		System.out.println(result);
	}
	
	//@Test
	public void getForObjectTest() {
		RestTemplate rest = new RestTemplate(); {
		String uri = "http://localhost/myserver/empSelect";
		Employee[] emp = rest.getForObject(uri, Employee[].class);
		System.out.println(emp[0].getFirst_name());
		}
	}
		
	//@Test
	public void getForEntityTest() {
		RestTemplate rest = new RestTemplate();
		String uri = "http://localhost/myserver/empSelect";
		ResponseEntity<Employee[]> res = rest.getForEntity(uri,	Employee[].class);
		System.out.println(res.getBody()[0].getFirst_name());
		System.out.println(res.getStatusCode());
	}
	
}
