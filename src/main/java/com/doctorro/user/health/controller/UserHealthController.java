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
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.doctorro.common.PagingDTO;
import com.doctorro.user.health.dto.HealthDto;
import com.doctorro.user.join.dto.MemberDTO;

@Controller
@RequestMapping(value = "/user/", method = { RequestMethod.POST, RequestMethod.GET })
public class UserHealthController {

    @RequestMapping("health")
    public String userHealth(Model model, Principal principal, HttpServletRequest request,PagingDTO paging ) {
    	System.out.println("유저헬스 컨트롤탐");
    	
    	int page=1;
    	int realPageNumber=paging.getIndex()+1;
    	
    	//api 자료 total list
    	int totalCount = parseTotalCount();
    	System.out.println("전체 자료 갯수"+totalCount);
    	//paging dto에 전체 자료 갯수 삽입
    	paging.setTotal(totalCount);
    	
    	//현재 page 입력시 45개 자료 get
    	List<HealthDto> list = parse(realPageNumber);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("p", paging);
    	model.addAttribute("totalCount", totalCount);
    	
    	System.out.println("컨트롤러 최종 값"+ list.toString());
    	System.out.println("페이징 : " + paging.toString());
		System.out.println("게시글 총갯수 : " + totalCount);
    	//=================================================작업중
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
    
	//api 자료 전체 리스트 갯수 return
	public int parseTotalCount() {
		int totalCount=0;
		try{
		String url = "http://openapi.samsunghospital.com/service/healthstoryapi/healthstory?numOfRows="+"1";
		url +="&accessKey=AAABaC6Dvn88ZkLs9RJiOB%2By6KWs70rUOq0kwA%3D%3D&pageNo="+"1";
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		//전체 토탈 카운트
		NodeList totalList = doc.getElementsByTagName("body");
		Node totalNode =  totalList.item(0);
		Element totalEl = (Element) totalNode;
		System.out.println("총갯수 xhdd  : " + getTagValue("totalCount", totalEl)); 
		totalCount= Integer.parseInt(getTagValue("totalCount", totalEl));
		
	}catch (Exception e) {
		e.printStackTrace();
	}
		return totalCount;
}
	
	
    public List<HealthDto> parse(int page) {
    	 
		int numOfRow = 9;//each page 9개씩 출력 
		List<HealthDto> list = new ArrayList<HealthDto>();
		try{
			//while(true){
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
				
				//전체 토탈 카운트 - 일단 중복.추후 삭제
				/*
				 * NodeList totalList = doc.getElementsByTagName("body");
				Node totalNode =  totalList.item(0);
				Element totalEl = (Element) totalNode;
				System.out.println("총갯수  : " + getTagValue("totalCount", totalEl)); 
				int totalCount = Integer.parseInt(getTagValue("totalCount", totalEl));
				*/
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						System.out.println("######################");
						//System.out.println(eElement.getTextContent());
						System.out.println("컨텐츠 아이디  : " + getTagValue("contId", eElement));
						System.out.println("컨텐츠 제목  : " + getTagValue("contTitle", eElement));
						System.out.println("컨텐츠 소스 : " + getTagValue("contSrc", eElement));
						System.out.println("컨텐츠 요약 내용  : " + getTagValue("summary", eElement));
						System.out.println("컨텐츠 요약 내용  : " + getTagValue("thumImg", eElement));
						System.out.println("모바일용 썸네일 : " + getTagValue("mThumImg", eElement));
						System.out.println("컨텐츠 타입 : " + getTagValue("contType", eElement));
						System.out.println("최초등록일자 : " + getTagValue("frstRgsrDt", eElement));
						System.out.println("웹용 상세 페이지 : " + getTagValue("detailUrl", eElement));
						System.out.println("모바일용 상세 페이지 : " + getTagValue("mDetailUrl", eElement));
						System.out.println("컨텐츠 카운트 : " + getTagValue("contViewCnt", eElement));
						System.out.println("컨텐츠 추천수 : " + getTagValue("recoCnt", eElement));
						
						HealthDto healthDto = new HealthDto();
						healthDto.setContId(Integer.parseInt(getTagValue("contId", eElement)));
						healthDto.setContTitle(getTagValue("contTitle", eElement));
						healthDto.setContSrc(getTagValue("contSrc", eElement));
						healthDto.setSummary(getTagValue("summary", eElement));
						healthDto.setThumImg(getTagValue("thumImg", eElement));
						healthDto.setMThumImg(getTagValue("mThumImg", eElement));
						healthDto.setContType(getTagValue("contType", eElement));
						healthDto.setFrstRgsrDt(getTagValue("frstRgsrDt", eElement));
						healthDto.setDetailUrl(getTagValue("detailUrl", eElement));
						healthDto.setContViewCnt(getTagValue("contViewCnt", eElement));
						healthDto.setRecoCnt(getTagValue("recoCnt", eElement));
						
						list.add(temp, healthDto);
					}	// if end
				}	//  for end
				
				/*페이지 넘기는 것
				page += 1;
				System.out.println("page number : "+page);
				if(page > 12){	
					break;
				}*/
				
			//}	// while end
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
		return list;
    }
    
}
