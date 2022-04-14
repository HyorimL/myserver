package com.yedam.myserver.emp.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.myserver.emp.vo.Departments;
import com.yedam.myserver.emp.vo.Employee;
import com.yedam.myserver.emp.vo.Jobs;

public interface EmployeeMapper {

	List<Employee> findEmployees();		//�궗�썝寃��깋
	int persist(Employee emp);			//�궗�썝�벑濡�
	int merge(Employee emp);			//�궗�썝�닔�젙
	int remove(Employee emp);			//�궗�썝�궘�젣
	
	List<Jobs> findJobs();				//job寃��깋
	List<Departments> findDepartments();//遺��꽌寃��깋
	List<Map<String, Object>> findStat(); 	//부서별 인원수
	List<Map<String, Object>> avgSalary(); 	//부서별 평균 연봉
}
