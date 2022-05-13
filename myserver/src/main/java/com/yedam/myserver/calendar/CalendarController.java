package com.yedam.myserver.calendar;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CalendarController {
	
	@Autowired CaledarMapper calendarDAO;
	
	//�޷¿� �ŷ����� ���
	@RequestMapping(value="/monthView")
	public List<Calendar> totalTrans() {
		return calendarDAO.totalTrans();
	}
}
