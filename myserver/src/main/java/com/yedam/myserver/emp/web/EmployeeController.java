package com.yedam.myserver.emp.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.emp.mapper.EmployeeMapper;
import com.yedam.myserver.emp.vo.Employee;

@RestController
public class EmployeeController {
	private static final Logger logger = 
			LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeMapper employeeDao;
	
	//�궗�썝寃��깋
	@RequestMapping(value="/empSelect")
	public List<Employee> selectDepartment() {
		return employeeDao.findEmployees();
	}	
	
	//遺��꽌�� 吏곸뾽 寃��깋
	@RequestMapping(value="/empDeptJob")
	public Map<String, Object> jobDeptList() {
		Map<String, Object> map = new HashMap<>();
		map.put("jobs", employeeDao.findJobs());
		map.put("depts", employeeDao.findDepartments());
		return map;		
	}	
	
	//사원등록
	@RequestMapping(value="/empInsertJson", method=RequestMethod.POST )
	public  Employee empInsertEmployees(@RequestBody Employee bean) {
		employeeDao.persist(bean);
		return bean;
	}
	
	@RequestMapping(value="/empInsert", method=RequestMethod.POST )
	public  Employee insertEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.persist(bean);
		return bean;
	}
	
	//�궗�썝�젙蹂댁닔�젙
	@RequestMapping(value="/empUpdate", method=RequestMethod.POST )
	public  Employee updateEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.merge(bean);
		return bean;
	}	
	
	//�궗�썝�궘�젣
	@RequestMapping(value="/empDelete", method=RequestMethod.POST )
	public  Employee deleteEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.remove(bean);
		return bean;
	}
	
	@GetMapping("/findStat")
	@ResponseBody
	public List<Map<String, Object>> findStat() {
		return employeeDao.findStat();
	}
	
	@GetMapping("/avgSalary")
	@ResponseBody
	public List<Map<String, Object>> avgSalary() {
		return employeeDao.avgSalary();
	}
}
