package com.doctorro.user.health.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.doctorro.user.health.dto.HealthDto;
import com.doctorro.user.join.dto.MemberDTO;

@Controller
@RequestMapping(value = "/user/")
public class UserHealthController {

/*	@Autowired
	private IndexService service;*/
	
    @RequestMapping("health")
    public String userHealth(Model model, Principal principal, HttpServletRequest request ) {
    	System.out.println("유저헬스 컨트롤탐");
    	
    	parse();
    	
        return "health.user";
    }
    
  	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		if(eElement.getElementsByTagName(tag).item(0)==null) {
			return "";
		}
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    return nValue.getNodeValue();
	}
    
	
	
    public HealthDto parse() {
    	int page = 1;	// 페이지 초기값 
		int numOfRow = 45;
		try{
			List<HealthDto> list = new ArrayList<HealthDto>(); 
			
			while(true){
				// parsing할 url 지정(API 키 포함해서)
				String url = "http://openapi.samsunghospital.com/service/healthstoryapi/healthstory?numOfRows="+numOfRow;
						url +="&accessKey=AAABaC6Dvn88ZkLs9RJiOB%2By6KWs70rUOq0kwA%3D%3D&pageNo="+page;
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// 최상위 태그 가져옴 
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						System.out.println("######################");
						//System.out.println(eElement.getTextContent());
						System.out.println("컨텐츠 아이디  : " + getTagValue("contId", eElement));
						System.out.println("컨텐츠 제목  : " + getTagValue("contTitle", eElement));
						System.out.println("컨텐츠 소스 : " + getTagValue("contSrc", eElement));
						System.out.println("컨텐츠 요약 내용  : " + getTagValue("Summary", eElement));
						System.out.println("컨텐츠 요약 내용  : " + getTagValue("thumImg", eElement));
						System.out.println("모바일용 썸네일 : " + getTagValue("mThumImg", eElement));
						System.out.println("컨텐츠 타입 : " + getTagValue("contType", eElement));
						System.out.println("최초등록일자 : " + getTagValue("frstRgsrDt", eElement));
						System.out.println("웹용 상세 페이지 : " + getTagValue("detailUrl", eElement));
						System.out.println("모바일용 상세 페이지 : " + getTagValue("mDetailUrl", eElement));
						System.out.println("컨텐츠 카운트 : " + getTagValue("contViewCnt", eElement));
						System.out.println("컨텐츠 추천수 : " + getTagValue("recoCnt", eElement));
						
						HealthDto healthDto = new HealthDto();
						healthDto.setContId(contId);
						객체 생성중 스탑 해야할건 ..
						페이지 걍 던지기
						
					}	// if end
				}	//  for end
				
				/*페이지 넘기는 것
				page += 1;
				System.out.println("page number : "+page);
				if(page > 12){	
					break;
				}*/
				
			}	// while end
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
		
		return 
    }
    
}
