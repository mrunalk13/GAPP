package gapp.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import gapp.model.Applications;
import gapp.model.Degrees;
import gapp.model.Departments;
import gapp.model.Gappusers;
import gapp.model.Programs;
import gapp.model.Status;
import gapp.model.Terms;
import gapp.model.dao.AdditionalFieldDao;
import gapp.model.dao.AdditionalFieldValueDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DegreesDao;
import gapp.model.dao.DepartmentsDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.StatusDao;
import gapp.model.dao.TermsDao;
import gapp.model.dao.UsersDao;

@Controller
@SessionAttributes({ "application", "degree", "afv", "app" })
public class ApplicationController {

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
	TermsDao termDao;

	@Autowired
	StatusDao statusDao;

	@Autowired
	AdditionalFieldDao afDao;

	@Autowired
	private ServletContext context;

	@RequestMapping(value = "selectProgram.html", method = RequestMethod.GET)
	public String NewApplication(@RequestParam Integer deptname, HttpServletResponse response) {

		List<Programs> programs = programDao.getProgramsByDepartment(deptname);
		List<String> list = new ArrayList<String>();
		String json = null;

		for (Programs pgm : programs) {
			list.add(pgm.getName());
		}

		json = new Gson().toJson(list);
		response.setContentType("application/json");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@RequestMapping(value = "NewApplication.html", method = RequestMethod.GET)
	public String NewApplication(@RequestParam Integer id, ModelMap models) {
		models.put("application", new Applications());
		models.put("users", userDao.getUser(id));
		models.put("departments", departmentDao.getDepartments());
		models.put("terms", termDao.getTerms());
		return "NewApplication";
	}

	@RequestMapping(value = "NewApplication.html", method = RequestMethod.POST)
	public String NewApplication(@ModelAttribute Applications application) {

		Gappusers user = userDao.getUser(application.getUser().getUser_id());
		Departments department = departmentDao.getDepartment(application.getDept().getDept_id());
		Programs program = programDao.getProgram(application.getProgram().getName());
		Status status = statusDao.getStatus(6);
		Terms term = termDao.getTerm(application.getTerm().getTerm_id());

		application.setUser(user);
		application.setDept(department);
		application.setProgram(program);
		application.setStatus(status);
		application.setTerm(term);

		Applications application1 = applicationDao.saveApplication(application);

		return "redirect:NewApplication1.html?appId=" + application1.getApplication_id();

	}

	@RequestMapping(value = "NewApplication1.html", method = RequestMethod.GET)
	public String NewApplication1(@RequestParam Integer appId, ModelMap models) {
		Applications application = applicationDao.getApplication(appId);
		models.put("application", application);
		models.put("degree", new Degrees());
		List<Degrees> degreeList = degreesdao.getDegrees(appId);
		models.put("degreesList", degreeList);
		return "NewApplication1";
	}

	@RequestMapping(value = "NewApplication1.html", method = RequestMethod.POST)
	public String NewApplication1(@ModelAttribute Degrees degree, @RequestParam MultipartFile file) throws IOException {

		Integer app_Id = degree.getApplication().getApplication_id();
		Applications application = applicationDao.getApplication(app_Id);
		String fname = file.getOriginalFilename();

		degree.setTranscript_name(fname);
		degree.setApplication(application);
		degree.setTranscript(file.getBytes());

		degreesdao.saveDegree(degree);
		return "redirect:NewApplication1.html?appId=" + application.getApplication_id();
	}

	@RequestMapping(value = "EditApplication.html", method = RequestMethod.GET)
	public String EditApplication(@RequestParam Integer id, @RequestParam Integer userId, ModelMap models) {
		models.put("users", userDao.getUser(userId));
		Applications app = applicationDao.getApplication(id);
		Integer dept_id = app.getDept().getDept_id();
		models.put("app", app);
		models.put("degrees", degreesdao.getDegrees(id));
		models.put("programs", programDao.getProgramsByDepartment(dept_id));
		models.put("terms", termDao.getTerms());
		return "EditApplication";
	}

	@RequestMapping(value = "EditApplication.html", method = RequestMethod.POST)
	public String EditApplication(@ModelAttribute Applications app) {

		//Applications application = app;
		Gappusers user = userDao.getUser(app.getUser().getUser_id());
		Programs program = programDao.getProgram(app.getProgram().getName());
		Terms term = termDao.getTerm(app.getTerm().getTerm_id());
		Departments department = departmentDao.getDepartment(app.getDept().getDept_id());
		Status status = statusDao.getStatus(6);
		// System.out.println(application.getApplication_id());

		app.setUser(user);
		app.setDept(department);
		app.setProgram(program);
		app.setStatus(status);
		app.setTerm(term);

		Applications application1 = applicationDao.saveApplication(app);

		return "redirect:EditApplication.html?id=" + application1.getApplication_id() + "&&userId=" + user.getUser_id();

	}

	@RequestMapping(value = "DeleteDegree.html")
	public String DeleteDegree(@RequestParam Integer degree_id, @RequestParam Integer app_Id) {
		degreesdao.deleteDegree(degree_id);
		return "redirect:NewApplication1.html?appId=" + app_Id;

	}

	@RequestMapping(value = "NewTranscript.html", method = RequestMethod.GET)
	public String NewTranscript(@RequestParam Integer app_Id, @RequestParam Integer id, ModelMap models) {

		Applications application = applicationDao.getApplication(app_Id);
		models.put("application", application);

		Degrees degree = degreesdao.getDegreebyId(id);
		models.put("degree", degree);

		return "NewTranscript";
	}

	@RequestMapping(value = "NewTranscript.html", method = RequestMethod.POST)
	public String NewTranscript(@RequestParam MultipartFile file, @RequestParam Integer app_id,
			@RequestParam Integer degree_id) throws IOException {
		
		String fname = file.getOriginalFilename();
		
		byte[] transcript = file.getBytes();		
		degreesdao.updateTrasncript(transcript, fname, degree_id);

		return "redirect:NewApplication1.html?appId=" + app_id;
	}

}
