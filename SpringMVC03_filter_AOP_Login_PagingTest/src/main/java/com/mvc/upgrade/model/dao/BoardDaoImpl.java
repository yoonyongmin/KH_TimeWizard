package com.mvc.upgrade.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upgrade.model.dto.BoardDto;
import com.mvc.upgrade.model.dto.PagingDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(BoardDaoImpl.class);

	@Override
	public List<BoardDto> selectList(PagingDto pagingDto) {
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList",pagingDto);
		} catch (Exception e) {
			logger.info("[ERROR] selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardDto selectOne(int myno) {
		
		BoardDto dto = new BoardDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", myno);
		} catch (Exception e) {
			logger.info("[ERROR] selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(BoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			logger.info("[ERROR] update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int myno) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", myno);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int countBoard() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countBoard");
		} catch (Exception e) {
			logger.info("[ERROR] countBoard");
			e.printStackTrace();
		}
		
		return res;
	}

}
