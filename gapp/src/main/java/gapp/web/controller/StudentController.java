package gapp.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import com.google.gson.Gson;

import gapp.model.Applications;
import gapp.model.Degrees;
import gapp.model.Departments;
import gapp.model.Gappusers;
import gapp.model.Programs;
import gapp.model.dao.AdditionalFieldValueDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DegreesDao;
import gapp.model.dao.DepartmentsDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.UsersDao;

@Controller
@SessionAttributes("user")
public class StudentController {

	@Autowired
	ApplicationsDao applicationDao;

	@Autowired
	DegreesDao degreesdao;

	@Autowired
	AdditionalFieldValueDao afvDao;

	@Autowired
	DepartmentsDao departmentDao;

	@Autowired
	ProgramsDao programDao;
	
	@Autowired
	UsersDao userDao;
	
	@Autowired
	DegreesDao degreedao;

	@RequestMapping(value = "WelcomeStudent.html", method = RequestMethod.GET)
	public String WelcomeStudent1(ModelMap models) {
		Gappusers user = (Gappusers) models.get("user");
		List<Applications> applications = applicationDao.getApplications(user.getEmail());
		models.put("applications", applications);
		models.put("user", user);
		return "WelcomeStudent";

	}

	@RequestMapping(value = "ViewApplication.html", method = RequestMethod.GET)
	public String ViewApplication(ModelMap models, @RequestParam("id") Integer id) {
		models.put("application", applicationDao.getApplication(id));
		models.put("degrees", degreesdao.getDegrees(id));
		models.put("afv", afvDao.getAdditionalFieldValue(id));
		return "ViewApplication";
	}
	
	@RequestMapping(value = "/download/{id}.html",method = RequestMethod.GET)
    public void getAttachmenFromDatabase(@PathVariable Integer id, HttpServletResponse response){
     
        try {

           Degrees degree = degreedao.getDegreebyId(id);
        	
        	response.setHeader("Content-Disposition", "attachment; filename=\""+ degree.getTranscript_name() +"\"");
            response.setContentLength(degree.getTranscript().length);

            FileCopyUtils.copy(degree.getTranscript(), response.getOutputStream());

            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	

	

}
