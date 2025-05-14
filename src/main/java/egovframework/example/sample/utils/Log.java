package egovframework.example.sample.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Calendar;

public class Log {
	static public String projectName = "btc";

	static public String []DEBUGFILTERS= {
			"call" /* call 함수 흐름 로그 */
			,"err" /* 에러 로그 */
	} ;
	
	static public void write(String arg, boolean allLog) {
	    String filetimestamp = (Calendar.getInstance().getTime().getYear() + 1900) + "_"
	            + (Calendar.getInstance().getTime().getMonth() + 1) + "_" + Calendar.getInstance().getTime().getDate()
	            + "_" + Calendar.getInstance().getTime().getHours();
	    try {
	        String fname = "cblog";
	        if (!allLog) fname = "cblog_filter";
	        File file = new File("./logs/");
	        if (!file.exists()) {
	            file.mkdirs();
	        }
	        
	        // 한 달 전의 날짜 계산
	        Calendar oneMonthAgo = Calendar.getInstance();
	        oneMonthAgo.add(Calendar.MONTH, -1);

	        // 로그 파일 삭제
	        File[] logFiles = file.listFiles();
	        if (logFiles != null) {
	            for (File logFile : logFiles) {
	                if (logFile.getName().contains("cblog")) {
	                    try {
	                        // 파일명에서 날짜 정보를 추출하여 비교
	                        String[] parts = logFile.getName().replace("cblog_filter", "").replace("cblog", "").replace(".txt", "").split("_");
	                        if (parts.length == 4) { // Year, Month, Date, Hour
	                            int year = Integer.parseInt(parts[0]); // Year is at index 0
	                            int month = Integer.parseInt(parts[1]) - 1; // Month is at index 1 (zero-based)
	                            int date = Integer.parseInt(parts[2]); // Date is at index 2

	                            Calendar logFileDate = Calendar.getInstance();
	                            logFileDate.set(year, month, date);

	                            if (logFileDate.before(oneMonthAgo)) {
	                                logFile.delete();
	                            }
	                        }
	                    } catch (NumberFormatException e) {
	                        System.out.println("Error parsing date from file name: " + logFile.getName());
	                    }
	                }
	            }
	        }
	        
	        BufferedWriter bw = new BufferedWriter(new FileWriter("./logs/" + fname + filetimestamp + ".txt", true));
	        PrintWriter pw = new PrintWriter(bw, true);
	        pw.println(arg);
	        pw.flush();
	        pw.close();
	    } catch (Exception e) {
	        System.out.println("로그 기록 에러, 폴더 없거나 권한 오류일듯 : " + e.getMessage());
	    }
	}

	static public void print(String arg, String filter) {
		String time = Calendar.getInstance().getTime().toLocaleString();
		String out = time + ",[" + filter + "]," + arg;
		if (Arrays.asList(DEBUGFILTERS).contains(filter)) {
			System.out.println(out);
			Log.write(out, false);
		}
		Log.write(out, true);
	}
}
