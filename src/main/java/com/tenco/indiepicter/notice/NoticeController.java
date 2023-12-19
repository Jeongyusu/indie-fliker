package com.tenco.indiepicter.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.indiepicter.notice.response.NoticePagingResponseDTO;
import com.tenco.indiepicter.notice.response.NoticeResponseDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 페이지 (페이징 처리)
	// required=false : id값이 필수가 아닐때 사용
	// defaultValue="1" : 기본값 1로 설정
	@GetMapping("/paging")
	public String paging(
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			Model model) {
		
		List<Notice> noticePagingLists = this.noticeService.findByNoticePagingLists(page);
		NoticePagingResponseDTO noticePagingResponseDTO = this.noticeService.pagingParam(page);
		model.addAttribute("noticePagingLists", noticePagingLists);
		model.addAttribute("paging", noticePagingResponseDTO);
		
		return "mypage/notice";
	}
	
	@GetMapping("/notice-detail/{noticeId}")
	public String noticeDetail(@PathVariable Integer noticeId, Model model) {

		Notice notice = this.noticeService.findById(noticeId);
		model.addAttribute("notice", notice);

		return "mypage/notice_detail";
	}
	
}
