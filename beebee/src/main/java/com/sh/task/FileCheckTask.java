package com.sh.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sh.domain.BoardAttachVO;
import com.sh.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_ = {@Autowired})
	BoardAttachMapper attachMapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception{
		
		log.warn("File Check Task run .....");
		log.warn(new Date());
		
		// db의 파일들
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		// 먼저 폴더에 db에 있는 파일 확인
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get("D:\\upload", vo.getUploadPath(), vo.getUuid()
					+ "_" + vo.getFileName()))
					.collect(Collectors.toList());
		
		// 이미지 타입의 섬네일 파일
		fileList.stream().filter(vo -> vo.isFileType() == true)
				.map(vo -> Paths.get("D:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_"
						+ vo.getFileName()))
				.forEach(p -> fileListPaths.add(p));
		
		log.warn("========================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		// 어제 폴더
		File targetDir = Paths.get("D:\\upload",getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		log.warn("------------------------");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
	}
}
