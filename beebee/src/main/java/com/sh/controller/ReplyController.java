package com.sh.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sh.domain.BoomDownDTO;
import com.sh.domain.BoomUpDTO;
import com.sh.domain.Criteria;
import com.sh.domain.ReplyPageDTO;
import com.sh.domain.ReplyVO;
import com.sh.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

	public ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new",
			consumes = "application/json", // 들어오는 데이터 타입
			produces = {MediaType.TEXT_PLAIN_VALUE}) // 반환하는 데이터 타입
	public ResponseEntity<String> create(@RequestBody ReplyVO reply){
		log.info("ReplyVO : "+reply);
		
		int insertCount = service.register(reply);
		
		log.info("Reply Inser Count : " + insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		log.info("getList.........");
		
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		return new ResponseEntity<>(service.getListPage(cri, bno),HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		
		log.info("get : " + rno);
		
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	// 댓글 수정
	@PreAuthorize("principal.userNickName == #reply.replyer")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO reply,
			@PathVariable("rno") Long rno){
		reply.setRno(rno);
		
		log.info("rno : " + rno);
		log.info("modfiy : " + reply);
		
		return service.modify(reply) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value ="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("remove : " + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/boomUp/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> boomUp(@RequestBody BoomUpDTO boomUp, @PathVariable("rno") Long rno){
		log.info("boomUp REST " + rno);
		log.info("boomUp" + boomUp);
		boomUp.setRno(rno);
		if(service.boomUpRegister(boomUp) == 1) {
			service.boomUp(rno);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/boomDown/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> boomDown(@RequestBody BoomDownDTO boomDown, @PathVariable("rno") Long rno){
		log.info("boomUp REST " + rno);
		log.info("boomUp" + boomDown);
		boomDown.setRno(rno);
		if(service.boomDownRegister(boomDown) == 1) {
			service.boomDown(rno);
			return new ResponseEntity<>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
