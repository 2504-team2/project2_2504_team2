package com.humancoffee.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

public class Common {
	final static String DEV_SUB_FOLDER = "\\src\\main\\webapp\\";
	public static String strProjectPath = null;
	
	public static String getStackTraceAsString(Throwable throwable) {
		StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        throwable.printStackTrace(pw);
        return sw.toString();
	}
	
	public String generateDateSequenceId10(String nowMaxId) {	// Product, Order 테이블의 ID 생성 함수
		LocalDateTime nowDateTime = LocalDateTime.now();
		int cnt = 1;
		String strId = String.format("%04d%02d%02d", 
				nowDateTime.getYear(), nowDateTime.getMonthValue(), nowDateTime.getDayOfMonth(), nowDateTime.getHour(), nowDateTime.getMinute(), nowDateTime.getSecond());
		
		if(nowMaxId.substring(0, strId.length()).equals(strId)) {
			String strSequence;
			strSequence = nowMaxId.substring(strId.length());
			cnt = Integer.parseInt(strSequence);
			cnt++;
		}
		return (strId + String.format("%02d", cnt));
	}
	
	public String generateDateTimeSequenceId16(String nowMaxId) {	// Product, Order 테이블의 ID 생성 함수
		LocalDateTime nowDateTime = LocalDateTime.now();
		int cnt = 1;
		String strId = String.format("%04d%02d%02d%02d%02d%02d", 
				nowDateTime.getYear(), nowDateTime.getMonthValue(), nowDateTime.getDayOfMonth(), nowDateTime.getHour(), nowDateTime.getMinute(), nowDateTime.getSecond());
		
		if(nowMaxId.substring(0, strId.length()).equals(strId)) {
			String strSequence;
			strSequence = nowMaxId.substring(strId.length());
			cnt = Integer.parseInt(strSequence);
			cnt++;
		}
		return (strId + String.format("%02d", cnt));
	}
	
	public String generateDateTimeSequenceId20(String nowMaxId) {	// Product, Order 테이블의 ID 생성 함수
		LocalDateTime nowDateTime = LocalDateTime.now();
		int cnt = 1;
		String strId = String.format("%04d%02d%02d%02d%02d%02d", 
				nowDateTime.getYear(), nowDateTime.getMonthValue(), nowDateTime.getDayOfMonth(), nowDateTime.getHour(), nowDateTime.getMinute(), nowDateTime.getSecond());
		
		if(nowMaxId.substring(0, strId.length()).equals(strId)) {
			String strSequence;
			strSequence = nowMaxId.substring(strId.length());
			cnt = Integer.parseInt(strSequence);
			cnt++;
		}
		return (strId + String.format("%06d", cnt));
	}
	//	파일을 저장하거나, 파일을 읽어들일 때 개발모드의 경우 절대경로로 해야 함.
	//	밑의 readFileToString()는 해당 경로의 파일을 읽어 내용을 리턴하는데 동일함.  
	public static String getProjectPath(String projectPath, String projectName) {
		
		if(strProjectPath == null) {
			System.out.println("projectPath: " + projectPath);
			System.out.println("projectName: " + projectName);
			System.out.println("getProperty: " + System.getProperty("user.dir"));
			int idx = projectPath.indexOf("\\.", 0);
			if(idx >= 0) {
				//	개발계
				String	myPath = projectPath.substring(0, idx);
				idx = projectName.indexOf("/");
				projectName = projectName.substring(idx + 1);
				myPath += "\\" + projectName;
				myPath += DEV_SUB_FOLDER;
				System.out.println("myPath: " + myPath);
				strProjectPath = myPath;
			}
		}
		return strProjectPath;
	}
	
	public static String readFileToString(String filePath) throws IOException {
		// Path 객체를 생성하여 파일 경로를 나타냅니다.
		System.out.println("filePath: " + filePath);
		filePath = "C:\\ThisIsJava\\workspace\\starbucks_web2\\src\\main\\webapp\\uploads\\html_tag정리.txt";
        Path path = Paths.get(filePath);
        // 파일이 존재하지 않으면 예외를 던집니다.
        if (!Files.exists(path)) {
            throw new IOException("파일을 찾을 수 없습니다: " + filePath);
        }

        // Files.readAllLines()를 사용하여 파일의 모든 라인을 읽어옵니다.
        // 그리고 Collectors.joining()을 사용하여 모든 라인을 하나의 문자열로 합칩니다.
        // 이 방법은 작은 파일에 적합하며, 대용량 파일의 경우 메모리 문제가 발생할 수 있습니다.
        try (var lines = Files.lines(path)) {
            return lines.collect(Collectors.joining(System.lineSeparator()));
        }
	}
}
