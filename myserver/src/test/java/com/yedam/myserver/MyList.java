package com.yedam.myserver;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;

import com.yedam.myserver.emp.vo.Employee;

/*class MyComp implements Comparator<Employee> {

	@Override
	public int compare(Employee o1, Employee o2) {
		// TODO Auto-generated method stub
		return o1.getFirst_name().compareTo(o2.getFirst_name());
	}
	
}*/

public class MyList {

	@Test
	public void test1() {
		//����Ŭ���� -> ���ٽ�
		List<Employee> list = new ArrayList<Employee>();
		list.add(new Employee("ȫ�浿"));
		list.add(new Employee("��浿"));
		list.sort((Employee o1, Employee o2) -> o1.getFirst_name().compareTo(o2.getFirst_name()));
		System.out.println(list);
	}
}
