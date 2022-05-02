package com.yedam.myserver;

import java.io.IOException;
import java.net.URL;
import java.util.List;

import org.junit.Test;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.myserver.emp.vo.Departments;
import com.yedam.myserver.emp.vo.Employee;

public class ObjectMapperTest {

	//@Test
	public void toJson() throws JsonGenerationException, JsonMappingException, IOException {
		Departments dept = new Departments();
		dept.setDepartment_id("500");
		dept.setDepartment_name("인사");
		//new ObjectMapper().writeValue(new File("dept.json"), dept);
		String str = new ObjectMapper().writeValueAsString(dept);
		System.out.println(str);
		
	}
	
	//@Test
	public void toObject() throws JsonMappingException, JsonProcessingException {
		String str = "{\"location_id\":null,\"city\":null,\"manager_id\":null,\"manager_name\":null,\"department_name\":\"인사\",\"department_id\":\"500\"}";
		Departments dept = new Departments();
		//new ObjectMapper().Value(new File("dept.json"), dept);
		Departments dept1 = new ObjectMapper().readValue(str, Departments.class);
		System.out.println(dept1.getDepartment_name());
	}
	
	@Test
	public void URLtoObject() throws Exception {
		String reqURL = "http://localhost/myserver/empSelect";
		URL url = new URL(reqURL);
		List<Employee> emp = new ObjectMapper().readValue(url, new TypeReference<List<Employee>>(){});
		//(){} -> 
		//첫번째 사원 이름 출력
		System.out.println(emp.get(0).getFirst_name());
		
	}
}
