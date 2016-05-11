package gapp.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import gapp.model.AdditionalField;
import gapp.model.AdditionalFieldValue;
import gapp.model.Applications;
import gapp.model.Degrees;
import gapp.model.Departments;
import gapp.model.Status;
import gapp.model.dao.AdditionalFieldDao;
import gapp.model.dao.AdditionalFieldValueDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DegreesDao;
import gapp.model.dao.DepartmentsDao;
import gapp.model.dao.StatusDao;

@Controller
@SessionAttributes({ "application", "degree", "afv" })
public class AdditionalFieldController {
	
	
	@Autowired
	ApplicationsDao applicationDao;

	@Autowired
	DegreesDao degreesdao;

	@Autowired
	AdditionalFieldValueDao afvDao;
	
	@Autowired
	AdditionalFieldDao afDao;
	
	@Autowired
	DepartmentsDao departmentDao;
	
	@Autowired
	StatusDao statusDao;

	
	@RequestMapping(value = "AddAdditionalReq.html", method = RequestMethod.GET)
	public String AddAdditionalReq(@RequestParam Integer appId, ModelMap models) {
		
		Applications application = applicationDao.getApplication(appId);
		models.put("application", application);
		models.put("af", afDao.getAdditionalFields(application.getDept().getDept_id()));
		models.put("afvList", afvDao.getAdditionalFieldValue(appId));
		models.put("afv", new AdditionalFieldValue());		
		
		return "AddAdditionalReq";
		
	}
	
	@RequestMapping(value = "AddAdditionalReq.html", method = RequestMethod.POST)
	public String AddAdditionalReq(@ModelAttribute AdditionalFieldValue afv, @RequestParam Integer appId,
			@RequestParam Integer fieldId) throws IOException {

		Applications app = applicationDao.getApplication(appId);
		AdditionalField field = afDao.getAdditionalFieldbyId(fieldId);				
		
		afv.setApplication(app);
		afv.setField(field);		
		afvDao.SaveAFV(afv);		

		return "redirect:AddAdditionalReq.html?appId=" +appId;
	}
	
	
	@RequestMapping(value = "UploadAdditionalReqFile.html", method = RequestMethod.POST)
	public String UploadAdditionalReqFile(@RequestParam Integer appId,
			@RequestParam Integer fieldId, @RequestParam MultipartFile file) throws IOException {

		Applications app = applicationDao.getApplication(appId);
		AdditionalField field = afDao.getAdditionalFieldbyId(fieldId);
		AdditionalFieldValue afv = new AdditionalFieldValue();
		
		if(file != null){
		if(!file.isEmpty()){
		String fname = file.getOriginalFilename();
		afv.setValue(fname);
		}
		}
		
		afv.setApplication(app);
		afv.setField(field);
		afv.setFile(file.getBytes());	
		afvDao.SaveAFV(afv);		

		return "redirect:AddAdditionalReq.html?appId=" +appId;
	}
	
	@RequestMapping(value = "SaveApplication.html", method = RequestMethod.GET)
	public String SaveApplication()  {
		return "redirect:WelcomeStudent.html";
	}
	
	@RequestMapping(value = "SubmitApplication.html", method = RequestMethod.GET)
	public String SubmitApplication(@RequestParam Integer appId)  {
		
		Applications app = applicationDao.getApplication(appId);
		Status status = statusDao.getStatus(1);		
		
		Date currentdate = new Date();
			 
		
		app.setStatus(status);
		app.setSubmitted_date(currentdate);
		
		applicationDao.submitApplication(status, currentdate, appId);
	
		return "redirect:WelcomeStudent.html";
	}
	
	@RequestMapping(value = "/downloadAddReq/{id}.html",method = RequestMethod.GET)
    public void downloadAddReq(@PathVariable Integer id, HttpServletResponse response){
     
        try {

        	AdditionalFieldValue afv = afvDao.getAFVbyId(id);
        	
        	response.setHeader("Content-Disposition", "attachment; filename=\""+ afv.getValue()+"\"");
            response.setContentLength(afv.getFile().length);

            FileCopyUtils.copy(afv.getFile(), response.getOutputStream());

            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }
	
	@RequestMapping(value = "EditAddReq.html", method = RequestMethod.GET)
	public String EditAddReq(@RequestParam Integer id, ModelMap models) {

		AdditionalFieldValue afv = afvDao.getAFVbyId(id);
				
		models.put("afv", afv);	
		return "EditAddReq";
	}

	@RequestMapping(value = "EditAddReq.html", method = RequestMethod.POST)
	public String EditAddReq(@RequestParam Integer id, @RequestParam String fvalue) throws IOException {
		
	    afvDao.UpdateFieldValue(fvalue, id);
		
		AdditionalFieldValue afv = afvDao.getAFVbyId(id);
		Integer appId = afv.getApplication().getApplication_id();

		return "redirect:AddAdditionalReq.html?appId=" + appId;
	}
	
	
	@RequestMapping(value = "EditAddReqFile.html", method = RequestMethod.GET)
	public String EditAddReqFile(@RequestParam Integer id, ModelMap models) {

		AdditionalFieldValue afv = afvDao.getAFVbyId(id);
				
		models.put("afv", afv);	
		return "EditAddReqFile";
	}

	@RequestMapping(value = "EditAddReqFile.html", method = RequestMethod.POST)
	public String EditAddReqFile(@RequestParam MultipartFile file, 
			@RequestParam Integer id) throws IOException {
		
		String fname = file.getOriginalFilename();		
		byte[] newFile = file.getBytes();			
		afvDao.UpdateFile(newFile, fname, id);
		
		AdditionalFieldValue afv = afvDao.getAFVbyId(id);
		Integer appId = afv.getApplication().getApplication_id();

		return "redirect:AddAdditionalReq.html?appId=" + appId;
	}
}

