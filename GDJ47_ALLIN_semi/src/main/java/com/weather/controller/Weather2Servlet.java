package com.weather.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class Weather2Servlet
 */
@WebServlet("/publicdata2.do")
public class Weather2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Weather2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿실행!");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
        Calendar calendar = Calendar.getInstance();

        Date dateObj = calendar.getTime();
        String formattedDate = sdf.format(dateObj);
        System.out.println(formattedDate);
        
        LocalTime now = LocalTime.now();
        
        int hour=now.getHour();
        System.out.println(hour);
        String finalDate=formattedDate;
        
        if(hour>=0&&hour<5){
        	Calendar cal = Calendar.getInstance();
        	String format = "yyyyMMdd";
        	SimpleDateFormat ytd = new SimpleDateFormat(format);
        	cal.add(cal.DATE, -1); //날짜를 하루 뺀다.
        	String date = ytd.format(cal.getTime());
        	finalDate=date;
        	System.out.println(finalDate);
        }else {
        	
        }
        
        
        String apiURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
        String authKey = "sRfnzN1mNZPaB7%2BM5goGf41P0g%2Bbz6C3KlOWcM7iuyrv9wknEsMIH7ZtCDoOk60pPMeOCuHUzrT4LaqapE6B8w%3D%3D"; // 본인 서비스 키

		// 구하고자 하는 시간과 좌표 대입
        String addressDo = request.getParameter("addressDo");
        String addressDogun = request.getParameter("addressDogun");
        String nx ="";
        String ny ="";
        
        //격자 x,y 값 db에서 가져오기
        List<WeatherRegion> list = new ArrayList();
        
        list = new WeatherService().selectWeatherRegion(addressDo, addressDogun);
        nx = Integer.toString(list.get(0).getNx());
        ny = Integer.toString(list.get(0).getNy());
        
        String baseTime = now+"00";
        System.out.println(baseTime);

       // String dataType = "JSON";

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=5Px%2FfloNzPvgR%2BiFfsnKAZ4AickDiHFk1W4xK2nd%2FJt1C4xEpzlu%2F1VkMl20TwhwyLq4YEvdwNdagqF%2BQtIFmA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(finalDate, "UTF-8")); /*‘21년 6월 28일 발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /*06시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		/*
		 * StringBuilder urlBuilder = new StringBuilder(apiURL); urlBuilder.append("?" +
		 * URLEncoder.encode("serviceKey", "UTF-8") + "=" + authKey);
		 * urlBuilder.append("&" + URLEncoder.encode("numOfRows=10", "UTF-8")); // 표 개수
		 * urlBuilder.append("&" + URLEncoder.encode("pageNo=1", "UTF-8")); // 페이지 수 //
		 * JSON 형식으로 반환을 원하면 주석 제거 urlBuilder.append("&" + URLEncoder.encode("dataType",
		 * "UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8")); // 받으려는 타입
		 * urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" +
		 * URLEncoder.encode(finalDate, "UTF-8")); // 조회하고 싶은 날짜 urlBuilder.append("&" +
		 * URLEncoder.encode("base_time", "UTF-8") + "=" + URLEncoder.encode(baseTime,
		 * "UTF-8")); // 조회하고싶은 시간 urlBuilder.append("&" + URLEncoder.encode("nx",
		 * "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); // x좌표
		 * urlBuilder.append("&" + URLEncoder.encode("ny", "UTF-8") + "=" +
		 * URLEncoder.encode(ny, "UTF-8")); // y좌표
		 * 
		 * URL url = new URL(urlBuilder.toString()); System.out.println(url);
		 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		 * conn.setRequestMethod("GET"); conn.setRequestProperty("Content-type",
		 * "application/json"); System.out.println("Response code: " +
		 * conn.getResponseCode()); BufferedReader rd; if (conn.getResponseCode() >= 200
		 * && conn.getResponseCode() <= 300) { rd = new BufferedReader(new
		 * InputStreamReader(conn.getInputStream())); } else { rd = new
		 * BufferedReader(new InputStreamReader(conn.getErrorStream())); } StringBuilder
		 * sb = new StringBuilder(); String line; while ((line = rd.readLine()) != null)
		 * { sb.append(line); } rd.close(); conn.disconnect(); String result =
		 * sb.toString();
		 * 
		 * // 테스트를 위해 출력 System.out.println(result);
		 */
             
        response.setContentType("application/json;charset=utf-8");
        new Gson().toJson(sb,response.getWriter());
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
