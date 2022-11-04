package kr.co.itwill.media;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.utility.UploadSaveManager;

@Controller
public class MediaCont {
	
	@Autowired
	private MediaDAO dao=new MediaDAO();
	
	public MediaCont() {
		System.out.println("-----MediaCont() 객체 생성됨");
	}//end
	
	@RequestMapping("/media/list.do")
	public ModelAndView list(int mediagroupno) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/list");
		mav.addObject("list", dao.list(mediagroupno));
		mav.addObject("mediagroupno", mediagroupno); //부모글번호
		return mav;
	}//list() end
	
	@RequestMapping(value = "/media/create.do", method = RequestMethod.GET)
	public ModelAndView createForm(int mediagroupno) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/createForm");
		mav.addObject("mediagroupno", mediagroupno); //부모글번호
		return mav;
	}//createForm() end
	

	@RequestMapping(value = "/media/create.do", method = RequestMethod.POST)
    public ModelAndView createProc(@ModelAttribute MediaDTO dto, HttpServletRequest req) {
                        //String title, MultipartFile posterMF, MultipartFile filenameMF)
        
        ModelAndView mav=new ModelAndView();
        mav.setViewName("media/msgView");
        
        ///////////////////////////////////////////////////
        //첨부된 파일 처리
        //->실제 파일은 /storage폴더에 저장
        //->저장된 파일 관련 정보는 media테이블에 저장
        
        //파일 저장 폴더의 실제 물리적인 경로 가져오기
        String basePath=req.getRealPath("/storage");
        
        //1)<input type='file' name='posterMF'>
        MultipartFile posterMF=dto.getPosterMF(); //파일 가져오기
        // /storage폴더에 파일 저장하고, 리네임된 파일명 반환
        String poster=UploadSaveManager.saveFileSpring30(posterMF, basePath);
        dto.setPoster(poster); //리네임된 파일명을 dto 객체 담기
        
        //2)<input type='file' name='filenameMF'>
        MultipartFile filenameMF=dto.getFilenameMF();
        String filename=UploadSaveManager.saveFileSpring30(filenameMF, basePath);
        dto.setFilename(filename);
        dto.setFilesize(filenameMF.getSize());
        ///////////////////////////////////////////////////
        
        
        int cnt=dao.create(dto);
        if(cnt==0) {
            String msg1="<p>음원 등록 실패</p>";
            String img="<img src='../images/fail.png'>";
            String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?mediagroupno=" + dto.getMediagroupno() + "\"'";
            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1); 
            mav.addObject("link2", link2); 
        }else {
            String msg1="<p>음원 등록 성공</p>";
            String img="<img src='../images/sound.png'>";
            String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?mediagroupno=" + dto.getMediagroupno() + "\"'";
            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link2", link2);
        }//if end        
        
        return mav;
        
    }//createProc() end
    
    
    
    @RequestMapping("/media/read.do")
    public ModelAndView read(int mediano) {
        ModelAndView mav=new ModelAndView();
        MediaDTO dto=dao.read(mediano);
        if(dto!=null) {
            String filename=dto.getFilename();     //파일명 가져오기
            filename=filename.toLowerCase();       //파일명 전부 소문자로 바꾸기
            if(filename.endsWith(".mp3")) {        //마직막 문자열이 .mp3인지?
                mav.setViewName("media/readMP3");
            }else if(filename.endsWith(".mp4")) {  //마직막 문자열이 .mp4인지?
                mav.setViewName("media/readMP4");
            }//if end
        }//if end
        
        mav.addObject("dto", dto);
        return mav;
    }//read() end
    
    
    @RequestMapping(value = "/media/delete.do", method = RequestMethod.GET)
    public ModelAndView deleteForm(int mediano) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("media/deleteForm");
        mav.addObject("mediano", mediano); //삭제할 글번호
        return mav;
    }//deleteForm() end
    
    
    @RequestMapping(value = "/media/delete.do", method = RequestMethod.POST)
    public ModelAndView deleteProc(int mediano, HttpServletRequest req) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("media/msgView");
        
        //삭제하고자 하는 글 정보 가져오기(/storage폴더에서 삭제할 파일명을 확인하기 위해)
        MediaDTO oldDTO=dao.read(mediano);
        
        int cnt=dao.delete(mediano);
        if(cnt==0) {
            String msg1="<p>음원 파일 삭제 실패!!</p>";
            String img="<img src='../images/fail.png'>";
            String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?mediagroupno=" + oldDTO.getMediagroupno() + "\"'";
            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1); 
            mav.addObject("link2", link2); 
            
        }else {
            String msg1="<p>음원 파일이 삭제되었습니다</p>";
            String img="<img src='../images/sound.png'>";
            String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?mediagroupno=" + oldDTO.getMediagroupno() + "\"'";
            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link2", link2);
            
            //첨부해던 파일 삭제
            String basePath=req.getRealPath("/storage");
            UploadSaveManager.deleteFile(basePath, oldDTO.getPoster());
            UploadSaveManager.deleteFile(basePath, oldDTO.getFilename());
        }//if end
        
        return mav;
        
    }//deleteProc() end
    
    
    @RequestMapping(value = "/media/update.do", method = RequestMethod.POST)
    public ModelAndView updateProc(@ModelAttribute MediaDTO dto, HttpServletRequest req) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("media/msgView");
        
        String basePath=req.getRealPath("/storage");
        MediaDTO oldDTO=dao.read(dto.getMediano()); //기존에 저장된 정보를 가져오기
        
        ////////////////////////////////////////////////////////////////////
        //파일을 수정할 것인지?
        
        //1)
        MultipartFile posterMF=dto.getPosterMF();
        if(posterMF.getSize()>0) { //새로운 포스터 파일이 첨부되어 전송되었는지?
            UploadSaveManager.deleteFile(basePath, oldDTO.getPoster()); //기존에 저장되어 있는 파일 삭제
            String poster=UploadSaveManager.saveFileSpring30(posterMF, basePath);//신규로 전송된 파일 저장
            dto.setPoster(poster);
        }else {
            //포스터 파일은 수정하지 않은 경우
            dto.setPoster(oldDTO.getPoster()); //기존에 저장된 파일
        }//if end
         
        
        //2)
        MultipartFile filenameMF = dto.getFilenameMF();
        if(filenameMF.getSize()>0){
            UploadSaveManager.deleteFile(basePath, oldDTO.getFilename());
            String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
            dto.setFilename(filename);             
            dto.setFilesize(filenameMF.getSize());      
        }else {
            dto.setFilename(oldDTO.getFilename());
            dto.setFilesize(oldDTO.getFilesize());
        }//if end        
        ////////////////////////////////////////////////////////////////////
        
        return mav;
    }//updateProc() end
	
}//class end
