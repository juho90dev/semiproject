package com.search.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchPage
 */
@WebServlet("/searchPage.do")
public class SearchPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String addressDo = request.getParameter("addressDo");
		String addressDogun = request.getParameter("addressDogun");
		String text = request.getParameter("text");
		int areacode = 0;
		int sigungucode = 0;
		// 분기처리
		if (addressDo == "서울") {
			areacode = 1;
			if (addressDogun == "강남구") {
				sigungucode = 1;
			} else if (addressDogun == "강동구") {
				sigungucode = 2;
			} else if (addressDogun == "강북구") {
				sigungucode = 3;
			} else if (addressDogun == "강서구") {
				sigungucode = 4;
			} else if (addressDogun == "관악구") {
				sigungucode = 5;
			} else if (addressDogun == "광진구") {
				sigungucode = 6;
			} else if (addressDogun == "구로구") {
				sigungucode = 7;
			} else if (addressDogun == "금천구") {
				sigungucode = 8;
			} else if (addressDogun == "노원구") {
				sigungucode = 9;
			} else if (addressDogun == "도봉구") {
				sigungucode = 10;
			} else if (addressDogun == "동대문구") {
				sigungucode = 11;
			} else if (addressDogun == "동작구") {
				sigungucode = 12;
			} else if (addressDogun == "마포구") {
				sigungucode = 13;
			} else if (addressDogun == "서대문구") {
				sigungucode = 14;
			} else if (addressDogun == "서초구") {
				sigungucode = 15;
			} else if (addressDogun == "성동구") {
				sigungucode = 16;
			} else if (addressDogun == "성북구") {
				sigungucode = 17;
			} else if (addressDogun == "송파구") {
				sigungucode = 18;
			} else if (addressDogun == "양천구") {
				sigungucode = 19;
			} else if (addressDogun == "영등포구") {
				sigungucode = 20;
			} else if (addressDogun == "용산구") {
				sigungucode = 21;
			} else if (addressDogun == "은평구") {
				sigungucode = 22;
			} else if (addressDogun == "종로구") {
				sigungucode = 23;
			} else if (addressDogun == "중구") {
				sigungucode = 24;
			} else if (addressDogun == "중랑구") {
				sigungucode = 25;
			}
		} else if (addressDo == "인천") {
			areacode = 2;
			if (addressDogun == "강화군") {
				sigungucode = 1;
			} else if (addressDogun == "계양구") {
				sigungucode = 2;
			} else if (addressDogun == "미추홀구") {
				sigungucode = 3;
			} else if (addressDogun == "남동구") {
				sigungucode = 4;
			} else if (addressDogun == "동구") {
				sigungucode = 5;
			} else if (addressDogun == "부평구") {
				sigungucode = 6;
			} else if (addressDogun == "서구") {
				sigungucode = 7;
			} else if (addressDogun == "연수구") {
				sigungucode = 8;
			} else if (addressDogun == "용진군") {
				sigungucode = 9;
			} else if (addressDogun == "중구") {
				sigungucode = 10;
			}
		} else if (addressDo == "대전") {
			areacode = 3;
			if (addressDogun == "대덕구") {
				sigungucode = 1;
			} else if (addressDogun == "동구") {
				sigungucode = 2;
			} else if (addressDogun == "서구") {
				sigungucode = 3;
			} else if (addressDogun == "유성구") {
				sigungucode = 4;
			} else if (addressDogun == "중구") {
				sigungucode = 5;
			}
		} else if (addressDo == "대구") {
			areacode = 4;
			if (addressDogun == "남구") {
				sigungucode = 1;
			} else if (addressDogun == "달서구") {
				sigungucode = 2;
			} else if (addressDogun == "달성군") {
				sigungucode = 3;
			} else if (addressDogun == "동구") {
				sigungucode = 4;
			} else if (addressDogun == "북구") {
				sigungucode = 5;
			} else if (addressDogun == "서구") {
				sigungucode = 6;
			} else if (addressDogun == "수성구") {
				sigungucode = 7;
			} else if (addressDogun == "중구") {
				sigungucode = 8;
			}

		} else if (addressDo == "대구") {
			areacode = 5;
			if (addressDogun == "남구") {
				sigungucode = 1;
			} else if (addressDogun == "달서구") {
				sigungucode = 2;
			} else if (addressDogun == "달성군") {
				sigungucode = 3;
			} else if (addressDogun == "동구") {
				sigungucode = 4;
			} else if (addressDogun == "북구") {
				sigungucode = 5;
			}
		} else if (addressDo == "광주") {
			areacode = 5;
			if (addressDogun == "광산구") {
				sigungucode = 1;
			} else if (addressDogun == "남구") {
				sigungucode = 2;
			} else if (addressDogun == "동구") {
				sigungucode = 3;
			} else if (addressDogun == "북구") {
				sigungucode = 4;
			} else if (addressDogun == "서구") {
				sigungucode = 5;
			}
		} else if (addressDo == "부산") {
			areacode = 5;
			if (addressDogun == "강서구") {
				sigungucode = 1;
			} else if (addressDogun == "금정구") {
				sigungucode = 2;
			} else if (addressDogun == "기장군") {
				sigungucode = 3;
			} else if (addressDogun == "남구") {
				sigungucode = 4;
			} else if (addressDogun == "동구") {
				sigungucode = 5;
			} else if (addressDogun == "동래구") {
				sigungucode = 6;
			} else if (addressDogun == "부산진구") {
				sigungucode = 7;
			} else if (addressDogun == "북구") {
				sigungucode = 8;
			} else if (addressDogun == "사상구") {
				sigungucode = 9;
			} else if (addressDogun == "사하구") {
				sigungucode = 10;
			} else if (addressDogun == "서구") {
				sigungucode = 11;
			} else if (addressDogun == "수영구") {
				sigungucode = 12;
			} else if (addressDogun == "연제구") {
				sigungucode = 13;
			} else if (addressDogun == "영도구") {
				sigungucode = 14;
			} else if (addressDogun == "중구") {
				sigungucode = 15;
			} else if (addressDogun == "해운대구") {
				sigungucode = 16;
			}
		} else if (addressDo == "울산") {
			areacode = 7;
			if (addressDogun == "중구") {
				sigungucode = 1;
			} else if (addressDogun == "남구") {
				sigungucode = 2;
			} else if (addressDogun == "동구") {
				sigungucode = 3;
			} else if (addressDogun == "북구") {
				sigungucode = 4;
			} else if (addressDogun == "울주군") {
				sigungucode = 5;
			}
		} else if (addressDo == "세종") {
			areacode = 8;
			if (addressDogun == "세종특별자치시") {
				sigungucode = 1;
			}
		} else if (addressDo == "경기도") {
			areacode = 31;
			if (addressDogun == "가평군") {
				sigungucode = 1;
			} else if (addressDogun == "고양시") {
				sigungucode = 2;
			} else if (addressDogun == "과천시") {
				sigungucode = 3;
			} else if (addressDogun == "광명시") {
				sigungucode = 4;
			} else if (addressDogun == "광주시") {
				sigungucode = 5;
			} else if (addressDogun == "구리시") {
				sigungucode = 6;
			} else if (addressDogun == "군포시") {
				sigungucode = 7;
			} else if (addressDogun == "김포시") {
				sigungucode = 8;
			} else if (addressDogun == "남양주시") {
				sigungucode = 9;
			} else if (addressDogun == "동두천시") {
				sigungucode = 10;
			} else if (addressDogun == "부천시") {
				sigungucode = 11;
			} else if (addressDogun == "성남시") {
				sigungucode = 12;
			} else if (addressDogun == "수원시") {
				sigungucode = 13;
			} else if (addressDogun == "시흥시") {
				sigungucode = 14;
			} else if (addressDogun == "안산시") {
				sigungucode = 15;
			} else if (addressDogun == "안성시") {
				sigungucode = 16;
			} else if (addressDogun == "안양시") {
				sigungucode = 17;
			} else if (addressDogun == "양주시") {
				sigungucode = 18;
			} else if (addressDogun == "양평군") {
				sigungucode = 19;
			} else if (addressDogun == "여주시") {
				sigungucode = 20;
			} else if (addressDogun == "연천군") {
				sigungucode = 21;
			} else if (addressDogun == "오산시") {
				sigungucode = 22;
			} else if (addressDogun == "용인시") {
				sigungucode = 23;
			} else if (addressDogun == "의왕시") {
				sigungucode = 24;
			} else if (addressDogun == "의정부시") {
				sigungucode = 25;
			} else if (addressDogun == "이천시") {
				sigungucode = 26;
			} else if (addressDogun == "파주시") {
				sigungucode = 27;
			} else if (addressDogun == "평택시") {
				sigungucode = 28;
			} else if (addressDogun == "포천시") {
				sigungucode = 29;
			} else if (addressDogun == "하남시") {
				sigungucode = 30;
			} else if (addressDogun == "화성시") {
				sigungucode = 31;
			}
		} else if (addressDo == "강원도") {
			areacode = 32;
			if (addressDogun == "강릉시") {
				sigungucode = 1;
			} else if (addressDogun == "고성군") {
				sigungucode = 2;
			} else if (addressDogun == "동해시") {
				sigungucode = 3;
			} else if (addressDogun == "삼척시") {
				sigungucode = 4;
			} else if (addressDogun == "속초시") {
				sigungucode = 5;
			} else if (addressDogun == "양구군") {
				sigungucode = 6;
			} else if (addressDogun == "양양군") {
				sigungucode = 7;
			} else if (addressDogun == "영월군") {
				sigungucode = 8;
			} else if (addressDogun == "원주시") {
				sigungucode = 9;
			} else if (addressDogun == "인제군") {
				sigungucode = 10;
			} else if (addressDogun == "정선군") {
				sigungucode = 11;
			} else if (addressDogun == "철원군") {
				sigungucode = 12;
			} else if (addressDogun == "춘천시") {
				sigungucode = 13;
			} else if (addressDogun == "태백시") {
				sigungucode = 14;
			} else if (addressDogun == "평창군") {
				sigungucode = 15;
			} else if (addressDogun == "홍천군") {
				sigungucode = 16;
			} else if (addressDogun == "화천군") {
				sigungucode = 17;
			} else if (addressDogun == "횡성군") {
				sigungucode = 18;
			}
		} else if (addressDo == "충청북도") {
			areacode = 33;
			if (addressDogun == "괴산군") {
				sigungucode = 1;
			} else if (addressDogun == "단양군") {
				sigungucode = 2;
			} else if (addressDogun == "보은군") {
				sigungucode = 3;
			} else if (addressDogun == "영동군") {
				sigungucode = 4;
			} else if (addressDogun == "옥천군") {
				sigungucode = 5;
			} else if (addressDogun == "음성군") {
				sigungucode = 6;
			} else if (addressDogun == "제천시") {
				sigungucode = 7;
			} else if (addressDogun == "진천군") {
				sigungucode = 8;
			} else if (addressDogun == "청원군") {
				sigungucode = 9;
			} else if (addressDogun == "청주시") {
				sigungucode = 10;
			} else if (addressDogun == "충주시") {
				sigungucode = 11;
			} else if (addressDogun == "증평군") {
				sigungucode = 12;
			}
		} else if (addressDo == "충청남도") {
			areacode = 34;
			if (addressDogun == "공주시") {
				sigungucode = 1;
			} else if (addressDogun == "금산군") {
				sigungucode = 2;
			} else if (addressDogun == "논산시") {
				sigungucode = 3;
			} else if (addressDogun == "당진시") {
				sigungucode = 4;
			} else if (addressDogun == "보령시") {
				sigungucode = 5;
			} else if (addressDogun == "부여군") {
				sigungucode = 6;
			} else if (addressDogun == "서산시") {
				sigungucode = 7;
			} else if (addressDogun == "서천군") {
				sigungucode = 8;
			} else if (addressDogun == "아산시") {
				sigungucode = 9;
			} else if (addressDogun == "예산군") {
				sigungucode = 11;
			} else if (addressDogun == "천안시") {
				sigungucode = 12;
			} else if (addressDogun == "청양군") {
				sigungucode = 13;
			} else if (addressDogun == "태안군") {
				sigungucode = 14;
			} else if (addressDogun == "홍성군") {
				sigungucode = 15;
			} else if (addressDogun == "계룡시") {
				sigungucode = 16;
			}
		} else if (addressDo == "경상북도") {
			areacode = 35;
			if (addressDogun == "공주시") {
				sigungucode = 1;
			} else if (addressDogun == "금산군") {
				sigungucode = 2;
			} else if (addressDogun == "논산시") {
				sigungucode = 3;
			} else if (addressDogun == "당진시") {
				sigungucode = 4;
			} else if (addressDogun == "보령시") {
				sigungucode = 5;
			} else if (addressDogun == "부여군") {
				sigungucode = 6;
			} else if (addressDogun == "서산시") {
				sigungucode = 7;
			} else if (addressDogun == "서천군") {
				sigungucode = 8;
			} else if (addressDogun == "아산시") {
				sigungucode = 9;
			} else if (addressDogun == "예산군") {
				sigungucode = 11;
			} else if (addressDogun == "천안시") {
				sigungucode = 12;
			} else if (addressDogun == "청양군") {
				sigungucode = 13;
			} else if (addressDogun == "태안군") {
				sigungucode = 14;
			} else if (addressDogun == "홍성군") {
				sigungucode = 15;
			} else if (addressDogun == "계룡시") {
				sigungucode = 16;
			}
		} else if (addressDo == "경상북도") {
			areacode = 35;
			if (addressDogun == "경산시") {
				sigungucode = 1;
			} else if (addressDogun == "경주시") {
				sigungucode = 2;
			} else if (addressDogun == "고령군") {
				sigungucode = 3;
			} else if (addressDogun == "구미시") {
				sigungucode = 4;
			} else if (addressDogun == "군위군") {
				sigungucode = 5;
			} else if (addressDogun == "김천시") {
				sigungucode = 6;
			} else if (addressDogun == "문경시") {
				sigungucode = 7;
			} else if (addressDogun == "봉화군") {
				sigungucode = 8;
			} else if (addressDogun == "상주시") {
				sigungucode = 9;
			} else if (addressDogun == "성주군") {
				sigungucode = 10;
			} else if (addressDogun == "안동시") {
				sigungucode = 11;
			} else if (addressDogun == "영덕군") {
				sigungucode = 12;
			} else if (addressDogun == "영양군") {
				sigungucode = 13;
			} else if (addressDogun == "영주시") {
				sigungucode = 14;
			} else if (addressDogun == "영천시") {
				sigungucode = 15;
			} else if (addressDogun == "예천군") {
				sigungucode = 16;
			} else if (addressDogun == "울릉군") {
				sigungucode = 17;
			} else if (addressDogun == "울진군") {
				sigungucode = 18;
			} else if (addressDogun == "의성군") {
				sigungucode = 19;
			} else if (addressDogun == "청도군") {
				sigungucode = 20;
			} else if (addressDogun == "청송군") {
				sigungucode = 21;
			} else if (addressDogun == "칠곡군") {
				sigungucode = 22;
			} else if (addressDogun == "포항시") {
				sigungucode = 23;
			}
		} else if (addressDogun == "경상남도") {
			areacode = 36;
			if (addressDogun == "거제시") {
				sigungucode = 1;
			} else if (addressDogun == "거창군") {
				sigungucode = 2;
			} else if (addressDogun == "고성군") {
				sigungucode = 3;
			} else if (addressDogun == "김해시") {
				sigungucode = 4;
			} else if (addressDogun == "남해군") {
				sigungucode = 5;
			} else if (addressDogun == "마산시") {
				sigungucode = 6;
			} else if (addressDogun == "밀양시") {
				sigungucode = 7;
			} else if (addressDogun == "사천시") {
				sigungucode = 8;
			} else if (addressDogun == "산청군") {
				sigungucode = 9;
			} else if (addressDogun == "양산시") {
				sigungucode = 10;
			} else if (addressDogun == "의령군") {
				sigungucode = 12;
			} else if (addressDogun == "진주시") {
				sigungucode = 13;
			} else if (addressDogun == "진해시") {
				sigungucode = 14;
			} else if (addressDogun == "창녕군") {
				sigungucode = 15;
			} else if (addressDogun == "창원시") {
				sigungucode = 16;
			} else if (addressDogun == "통영시") {
				sigungucode = 17;
			} else if (addressDogun == "하동군") {
				sigungucode = 18;
			} else if (addressDogun == "함안군") {
				sigungucode = 19;
			} else if (addressDogun == "함양군") {
				sigungucode = 20;
			} else if (addressDogun == "합천군") {
				sigungucode = 21;
			}
		} else if (addressDogun == "전라북도") {
			areacode = 37;
			if (addressDogun == "고창군") {
				sigungucode = 1;
			} else if (addressDogun == "군산시") {
				sigungucode = 2;
			} else if (addressDogun == "김제시") {
				sigungucode = 3;
			} else if (addressDogun == "남원시") {
				sigungucode = 4;
			} else if (addressDogun == "무주군") {
				sigungucode = 5;
			} else if (addressDogun == "부안군") {
				sigungucode = 6;
			} else if (addressDogun == "순창군") {
				sigungucode = 7;
			} else if (addressDogun == "완주군") {
				sigungucode = 8;
			} else if (addressDogun == "익산시") {
				sigungucode = 9;
			} else if (addressDogun == "임실군") {
				sigungucode = 10;
			} else if (addressDogun == "장수군") {
				sigungucode = 11;
			} else if (addressDogun == "전주시") {
				sigungucode = 12;
			} else if (addressDogun == "정읍시") {
				sigungucode = 13;
			} else if (addressDogun == "진안군") {
				sigungucode = 14;
			}
		} else if (addressDogun == "전라남도") {
			areacode = 38;
			if (addressDogun == "강진군") {
				sigungucode = 1;
			} else if (addressDogun == "고흥군") {
				sigungucode = 2;
			} else if (addressDogun == "곡성군") {
				sigungucode = 3;
			} else if (addressDogun == "광양시") {
				sigungucode = 4;
			} else if (addressDogun == "구례군") {
				sigungucode = 5;
			} else if (addressDogun == "나주시") {
				sigungucode = 6;
			} else if (addressDogun == "담양군") {
				sigungucode = 7;
			} else if (addressDogun == "목포시") {
				sigungucode = 8;
			} else if (addressDogun == "무안군") {
				sigungucode = 9;
			} else if (addressDogun == "보성군") {
				sigungucode = 10;
			} else if (addressDogun == "순천시") {
				sigungucode = 11;
			} else if (addressDogun == "신안군") {
				sigungucode = 12;
			} else if (addressDogun == "여수시") {
				sigungucode = 13;
			} else if (addressDogun == "영광군") {
				sigungucode = 16;
			} else if (addressDogun == "영암군") {
				sigungucode = 17;
			} else if (addressDogun == "완도군") {
				sigungucode = 18;
			} else if (addressDogun == "장성군") {
				sigungucode = 19;
			} else if (addressDogun == "장흥군") {
				sigungucode = 20;
			} else if (addressDogun == "진도군") {
				sigungucode = 21;
			} else if (addressDogun == "함평군") {
				sigungucode = 22;
			} else if (addressDogun == "해남군") {
				sigungucode = 23;
			} else if (addressDogun == "화순군") {
				sigungucode = 24;
			}
		} else if (addressDogun == "제주") {
			areacode = 39;
			if (addressDogun == "남제주군") {
				sigungucode = 1;
			} else if (addressDogun == "북제주군") {
				sigungucode = 2;
			} else if (addressDogun == "서귀포시") {
				sigungucode = 3;
			} else if (addressDogun == "제주시") {
				sigungucode = 4;
			}
		}
		// ---------------------------------------------

		String maintema = request.getParameter("maintema");
		String subtema = request.getParameter("subtema");
		String text1 = request.getParameter("text1");
		String cat1 = "";
		String cat2 = "";
		// 분기처리
		if (maintema == "자연") {
			cat1 = "A01";
			if (subtema == "자연관광지") {
				cat2 = "A0101";
			} else if (subtema == "관광자원") {
				cat2 = "A0102";
			}
		} else if (maintema == "인문(문화/예술/역사)") {
			cat1 = "A02";
			if (subtema == "역사관광지") {
				cat2 = "A0201";
			} else if (subtema == "휴양관광지") {
				cat2 = "A0202";
			} else if (subtema == "체험관광지") {
				cat2 = "A0203";
			} else if (subtema == "산업관광지") {
				cat2 = "A0204";
			} else if (subtema == "건축/조형물") {
				cat2 = "A0205";
			} else if (subtema == "문화시설") {
				cat2 = "A0206";
			} else if (subtema == "축제") {
				cat2 = "A0207";
			} else if (subtema == "공연/행사") {
				cat2 = "A0208";
			}
		} else if (maintema == "추천코스") {
			cat1 = "C01";
			if (subtema == "가족코스") {
				cat2 = "C0112";
			} else if (subtema == "나홀로코스") {
				cat2 = "C0113";
			} else if (subtema == "힐링코스") {
				cat2 = "C0114";
			} else if (subtema == "도보코스") {
				cat2 = "C0115";
			} else if (subtema == "캠핑코스") {
				cat2 = "C0116";
			} else if (subtema == "맛코스") {
				cat2 = "C0117";
			}
		} else if (maintema == "레포츠") {
			cat1 = "A03";
			if (subtema == "레포츠소개") {
				cat2 = "A0301";
			} else if (subtema == "육상 레포츠") {
				cat2 = "A0302";
			} else if (subtema == "수상 레포츠") {
				cat2 = "A0303";
			} else if (subtema == "항공 레포츠") {
				cat2 = "A0304";
			} else if (subtema == "복합 레포츠") {
				cat2 = "A0305";
			}
		} else if (maintema == "숙박") {
			cat1 = "B02";
			if (subtema == "숙박시설") {
				cat2 = "B0201";
			}
		} else if (maintema == "쇼핑") {
			cat1 = "A04";
			if (subtema == "쇼핑") {
				cat2 = "A0401";
			}
		} else if (maintema == "음식") {
			cat1 = "A05";
			if (subtema == "음식점") {
				cat2 = "A0502";
			}
		}
		
		request.getRequestDispatcher("/views/search/searchpage.jsp").forward(request, response);
		
	}
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
