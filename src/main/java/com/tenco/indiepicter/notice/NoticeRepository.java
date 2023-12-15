package com.tenco.indiepicter.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tenco.indiepicter.notice.response.NoticeResponseDTO;

@Mapper
public interface NoticeRepository {

	// 공지사항 단일 조회
	public Notice findById(Integer id);
	
	// 공지사항 전체 조회
	public List<Notice> findAll();
	
	// 공지사항 페이징 조회
	public List<Notice> findByNoticePagingLists(Map<String, Integer> pagingParams);
	
	// 공지사항 전체 갯수 조회
	public Integer pageCount();
	
}
