package kr.co.itwill.product;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductCont {

	public ProductCont() {
		System.out.println("-----ProductCont() 객체 생성됨");
	}
	
	@Autowired
	ProductDAO productDao;
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", productDao.list());
		return mav;
	}//list() end
	
	@RequestMapping("/write")
	public String write() {
		return "product/write";
	}//write() end
	
	
	@RequestMapping("/insert")
	public String insert(@RequestParam Map<String, Object> map, @RequestParam MultipartFile img, HttpServletRequest req) {
		String filename = "-";
		long filesize = 0;
		if(img != null && img.isEmpty()) {
			filename = img.getOriginalFilename();
			filesize = img.getSize();
			try {
				ServletContext application = req.getSession().getServletContext();
				String path = application.getRealPath("/storage");
				//System.out.println(path);
				//I:\java202207\workspace_spring\spring07_myshop\src\main\webapp\storage
				img.transferTo(new File(path+"\\"+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}//try end
		}//if end
		
		map.put("filename", filename);
		map.put("filesize", filesize);
		productDao.insert(map);
		return "redirect:/product/list";
	}//insert() end
	
}//class end