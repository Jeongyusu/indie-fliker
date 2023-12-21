package com.tenco.indiepicter.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.indiepicter.notice.response.NoticePagingResponseDTO;
import com.tenco.indiepicter.notice.response.NoticeResponseDTO;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	// 공지사항 단일 조회
	public Notice findById(Integer id) {
		
		return this.noticeRepository.findById(id);
	}
	
	// 공지사항 전체 조회
	public List<Notice> findAll(){
		
		return this.noticeRepository.findAll();
	}
	
// ----------------------------------------------------------------------------------------------
	
	// 공지 사항 페이징 처리
	
	// 페이징을 위한 클래스 변수 선언
	int pageLimit = 5; // 한 페이지당 보여줄 글 갯수
	int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수
	
	// 공지사항 페이징 조회
	public List<Notice> noticePagingLists(Integer page){
		
		// 인덱스 번호 0부터 시작이기 때문에 -1 로 처리 해줌
		int pageStart = (page - 1) * pageLimit;
		
		// 쿼리문에 숫자를 두개 넘겨야 해서 Map사용
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("pageStart", pageStart);
		pagingParams.put("pageLimit", pageLimit);
		
		return this.noticeRepository.findByNoticePagingLists(pagingParams);
	}
	
	// 페이징 계산
	public NoticePagingResponseDTO pagingParam(Integer page) {
		// 전체 글 갯수 조회
		int pageCount = this.noticeRepository.pageCount();
		// 전체 페이지 갯수 계산 ( 총 갯수 / 한 페이지 당 갯수를 계산 후 소숫점 올림 계산 )
		int maxPage = (int)(Math.ceil((double) pageCount / pageLimit));
		// 시작 페이지 값 계산(1, 6, 11, 16 ~~~)
		int startPage = (((int)(Math.ceil((double) page/ blockLimit))) - 1) * blockLimit + 1;
		// 끝 페이지 값 계산(5, 10, 15, 20 ~~~)
		int endPage = startPage + blockLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		NoticePagingResponseDTO pagingDto = new NoticePagingResponseDTO();
		pagingDto.setPage(page);
		pagingDto.setMaxPage(maxPage);
		pagingDto.setStartPage(startPage);
		pagingDto.setEndPage(endPage);
		
		return pagingDto;
	}

// ----------------------------------------------------------------------------------------------
	
	
}
