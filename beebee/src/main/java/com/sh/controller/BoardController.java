package com.sh.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sh.domain.BoardAttachVO;
import com.sh.domain.BoardVO;
import com.sh.domain.Criteria;
import com.sh.domain.PageDTO;
import com.sh.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	/* 통합 게시판 */
	@GetMapping("/board-list")
	public void list(Model model,Criteria cri) {
		
		log.info("list");
		model.addAttribute("list",service.getList(cri));

		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	/* 공부 인증 게시판 */
	@GetMapping("/board-listStudy")
	public void listStudy(Model model,Criteria cri) {
		
		model.addAttribute("list",service.getList(cri));
		
		int total = service.getFreeTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	/* 자유 게시판 */
	@GetMapping("/board-listFree")
	public void listFree(Model model,Criteria cri) {
		
		model.addAttribute("list",service.getList(cri));

		int total = service.getFreeTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	/* 질문 게시판 */
	@GetMapping("/board-listQnA")
	public void listQnA(Model model,Criteria cri) {
		model.addAttribute("list",service.getList(cri));
		int total = service.getQnATotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	/* 자격증 게시판 */
	@GetMapping("/board-listCerti")
	public void listCerti(Model model,Criteria cri) {
		
		model.addAttribute("list",service.getList(cri));

		int total = service.getCertiTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@PostMapping("/board-register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("========================");
		log.info("register :" + board);
		
		log.info(" 여기 느낌 " + board.getAttachList());
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("========================");
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		log.info("board bno 값 :" + board.getBno());
		
		return "redirect:/board/board-list";
	}
	
	@GetMapping({"/board-get","/board-modify"})
	public void get(
			@RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("/get");
		model.addAttribute("board",service.get(bno));
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/board-modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {

		log.info("modify :" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/board/board-list" + cri.getListLink();
	}
	
	// 첨부파일 삭제
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) { return; }
		
		log.info("deleteFiles method : " + attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("D:\\upload\\" + attach.getUploadPath() + "\\"
						+ attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file); // null이여도 예외 X
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\upload\\" + attach.getUploadPath() + "\\s_"
							+ attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});// end forEach
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,@ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		
		log.info("remove...." + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/board-list" + cri.getListLink();
	}
	
	@GetMapping("/board-register")
	@PreAuthorize("isAuthenticated()")
	public void board_register() {
		
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
}
