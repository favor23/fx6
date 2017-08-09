package com.choa.fx6;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.campaign.CampaignDTO;
import com.choa.campaign.CampaignService;
import com.choa.controllor.MovieController;
import com.choa.movie.MovieDTO;
import com.choa.movie.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private MovieController movieController;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private CampaignService campaignService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	//인덱스~!!!!!!!!!!!!!인덱스~!!!!!!!!!!!!!인덱스~!!!!!!!!!!!!!인덱스~!!!!!!!!!!!!!인덱스~!!!!!!!!!!!!!
	@RequestMapping(value="/index")
	public void index(HttpServletRequest request){		
	fileLoad(request);
		
	}
	@RequestMapping(value="/defaultPage")
	public void defaultPage(){		
	}
	@RequestMapping(value="/temp/header")
	public void header(){	
	}
	
	@RequestMapping(value="/temp/footer")
	public void footer(){	
	}
	
	@RequestMapping(value="/temp/bootStrap")
	public void bootStarp(){	
	}
	
	@RequestMapping(value="/index_movielist/m1")
	public void m1(Model model,int num){
		//List<MovieDTO> list=movieController.movieList(1);
		movieController.movieList(1,model);
		//model.addAttribute("list", list);
		model.addAttribute("num",num);
		
	}
	@RequestMapping(value="/index_movielist/m2")
	public void m2(){}
	
	@RequestMapping(value="/index_movielist/m3")
	public void m3(){}
	
	@RequestMapping(value="/index_movielist/m4")
	public void m4(){}
	
	@RequestMapping(value="/index_movielist/modal_ticket")
	public void modal_ticket(int movie_num,Model model){
		movieController.movieView(movie_num, model);
	}
	
	@RequestMapping(value = "/crowd_funding/cf_index")
	public void cfIndex(Model model) {
		List<CampaignDTO> list = null;
		List<CampaignDTO> list2 = null;
		List<CampaignDTO> list3 = null;
		List<CampaignDTO> list4 = null;
		
		try {
			list = campaignService.campaignNew();
			list2 = campaignService.campaignBest();
			list3 = campaignService.campaignBest2();
			list4 = campaignService.campaignBest3();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("newList", list);
		model.addAttribute("bestList", list2);
		model.addAttribute("bestList2", list3);
		model.addAttribute("bestList3", list4);
	}
	
	
	
//////////////////시연용파일복사 //////////////////////////////////////////////////////////////////////////////////////
	


	
private void fileLoad(HttpServletRequest request) {

String path = "C:/spring/springworkspace/movie_fx6/src/main/webapp/resources/upload";
String path3 = "E:/kh/Spring/workspace/final_fx6/src/main/webapp/resources/upload";
File dirFile=new File(path);
File dirFile2=new File(path3);
File []fileList=dirFile.listFiles();
File []fileList2=dirFile2.listFiles();

for(File tempFile2 : fileList2) {
	if(tempFile2.isFile()) {
		String tempPath = tempFile2.getParent();
		String tempFileName = tempFile2.getName();
		String saveDir = request.getSession().getServletContext().getRealPath("upload");
		File path2 = new File(saveDir);
		
		if(!path2.exists()) {
			path2.mkdirs();
		}
		
		File file = new File(tempPath, tempFileName);
		File mfile = new File(saveDir, tempFileName);
		
		try {
			copyFile(file, mfile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

for(File tempFile : fileList) {
if(tempFile.isFile()) {
String tempPath=tempFile.getParent();
String tempFileName=tempFile.getName();

String saveDir = request.getSession().getServletContext().getRealPath("upload");

File path2 = new File(saveDir);
if(!path2.exists()) {
	path2.mkdirs();
}

File file = new File(tempPath, tempFileName);
File mfile = new File(saveDir, tempFileName);

try {
copyFile(file, mfile);
} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
}
}
}


private void copyFile(File file, File mfile) throws Exception{
InputStream inStream = null;
OutputStream outStream = null;	 	  


mfile.createNewFile();

try{
inStream = new FileInputStream(file); //원본파일
outStream = new FileOutputStream(mfile); //이동시킬 위치

byte[] buffer = new byte[1024];

int length;

while ((length = inStream.read(buffer)) > 0){
outStream.write(buffer, 0, length);
}
}catch(Exception e){
e.printStackTrace();
}finally{
inStream.close();
outStream.close();
}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
