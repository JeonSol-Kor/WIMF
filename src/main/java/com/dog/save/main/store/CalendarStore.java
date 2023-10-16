package com.dog.save.main.store;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.main.domain.Calendar;

public interface CalendarStore {

	int insertEvent(SqlSession session, Calendar calendar);

	List<Calendar> getAllEventList(SqlSession session);

	Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(SqlSession session, Map<String, Object> params);

	int deleteEvent(SqlSession session, int schNo);

	int updateEvent(SqlSession session, Map<String, Object> newParams);

}