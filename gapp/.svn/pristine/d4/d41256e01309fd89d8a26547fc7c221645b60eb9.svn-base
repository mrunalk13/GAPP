package gapp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gapp.model.AdditionalField;
import gapp.model.Departments;
import gapp.model.Gappusers;
import gapp.model.Programs;
import gapp.model.dao.AdditionalFieldDao;
import gapp.model.dao.DepartmentsDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.RolesDao;
import gapp.model.dao.UsersDao;

@Controller
@SessionAttributes("user")
public class HomeController {

	@Autowired
	UsersDao usersDao;
	
	@Autowired
	RolesDao rolesDao;
	
	@Autowired
	DepartmentsDao departmentsdao;
	
	@Autowired
	ProgramsDao programsdao;
	
	@Autowired
	AdditionalFieldDao additionalFieldDao;
	
	

	@RequestMapping(value = "Login.html", method = RequestMethod.GET)
	public String login1(ModelMap models) {
		models.put("user", new Gappusers());
		return "Login";

	}

	@RequestMapping(value = "Login.html", method = RequestMethod.POST)
	public String login2(@ModelAttribute Gappusers user, ModelMap model, HttpSession session, HttpServletRequest request) {
		Boolean valid = false;
		HttpSession ss = request.getSession();
		try {
			
			if (!usersDao.getUser(user.getEmail(), user.getPassword()).equals(null)) {
				valid = true;
				user = usersDao.getUser1(user.getEmail());
			} else
				valid = false;
		} catch (Exception e) {
			e.getMessage();
		}
		ss.setAttribute("Name", user.getFirst_name());
		ss.setAttribute("userId", user.getUser_id());
		model.put("user", user);
		if (valid) {
			if (user.getRole().getRole_type().equals("admin"))
				return "redirect:WelcomeAdmin.html";
			else if (user.getRole().getRole_type().equals("staff"))
				return "redirect:WelcomeStaff.html";
			else if (user.getRole().getRole_type().equals("student"))
				return "redirect:WelcomeStudent.html";

		}

		else
			model.addAttribute("message", "Incorrect Credentials");
		return "Login";

	}

	@RequestMapping(value = "Logout.html")
	public String logout( HttpSession session, HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:Login.html";
	}

	@RequestMapping(value = "Registration.html", method = RequestMethod.GET)
	public String Registration1(ModelMap models) {
		models.put("user", new Gappusers());
		return "Registration";

	}

	@RequestMapping(value = "Registration.html", method = RequestMethod.POST)
	public String Registration2(@ModelAttribute Gappusers user, @RequestParam String cpassword, ModelMap model) {

		Boolean exist = false;
		try {
			if (usersDao.getUser1(user.getEmail().toLowerCase()).equals(null)) {
				exist = false;				
			} else
				exist = true;
		} catch (Exception e) {
			e.getMessage();
		}
		

		if (!exist) {
			if (user.getPassword().equals(cpassword))
			{
				user.setEmail(user.getEmail().toLowerCase());
				//user.setUser_id(usersDao.getTotalUsers().size() + 1);
				user.setRole(rolesDao.getrole("student"));
				user.setEnabled(true);
				usersDao.saveUser(user);
				model.addAttribute("message", "Congratulations! You have Successfully Registered");
				return "Login";
				
			}
			else 
			model.addAttribute("message", "Password & Confirm Password doesnot match");
			return "Registration";
			}

		else
			model.addAttribute("message", "User already exist by this email id");
		return "Registration";

	}
	
	@RequestMapping(value = "WelcomeAdmin.html", method = RequestMethod.GET)
	public String WelcomeAdmin1(ModelMap model, HttpSession session) {        
		return "WelcomeAdmin";

	}
	
	@RequestMapping(value = "ManageDepartment.html", method = RequestMethod.GET)
	public String ManageDepartment1(ModelMap model, HttpSession session) {
        List<Departments> department = departmentsdao.getDepartments();
        List<Programs> programs = programsdao.getPrograms();
        model.put("department", department);
        model.put("programs", programs);
		return "ManageDepartment";

	}
	
	@RequestMapping(value = "DepartmentDetail.html", method = RequestMethod.GET)
	public String DepartmentDetail1(ModelMap model, @RequestParam String name) {   
		Integer id = departmentsdao.getDepartment(name).getDept_id();
		// String deptname = name;
		Departments department = departmentsdao.getDepartment(name);
	    List<AdditionalField> addtionalField = additionalFieldDao.getAdditionalFields(id);	    
	    List<Programs> programs = programsdao.getProgramsByDepartment(id);
	    model.put("addtionalField", addtionalField);
	    model.put("programs", programs);
	    model.put("department", department);
		return "DepartmentDetail";
	}
	
	@RequestMapping(value = "AddDepartment.html", method = RequestMethod.GET)
	public String AddDepartment1(ModelMap model) {
		model.put("user", new  Departments());
		return "AddDepartment";

	}
	
	@RequestMapping(value = "AddDepartment.html", method = RequestMethod.POST)
	public String AddDepartment2(@ModelAttribute Departments user,  ModelMap model) {
		
		Boolean exist = false;
		try {
			if (departmentsdao.getDepartment(user.getName()).equals(null)) {
				exist = false;				
			} else
				exist = true;
		} catch (Exception e) {
			e.getMessage();
		}
		if (!exist) {							
				departmentsdao.saveDepartment(user);
				model.addAttribute("message", "Department added");
				return "redirect:ManageDepartment.html";				
			}
			else 
			model.addAttribute("message", "Department already exist");
			return "AddDepartment";
	}

	@RequestMapping(value = "AddProgram.html", method = RequestMethod.GET)
	public String AddProgram1(@ModelAttribute Programs user, ModelMap model) {
		List<Departments> department = departmentsdao.getDepartments();
		model.put("department", department);
		model.put("user", new  Programs());
		return "AddProgram";

	}
	
	@RequestMapping(value = "AddProgram.html", method = RequestMethod.POST)
	public String AddProgram2(@ModelAttribute Programs user, @RequestParam String department, ModelMap model) {
				
		List<Programs> programs = programsdao.getProgramsByDepartment(departmentsdao.getDepartment(department).getDept_id());
		
		Boolean exist = false;
		try {
			  for (Programs entity : programs) {
				  if (entity.getName().equals(user.getName())) {
						exist = true;				
					} else
						exist = false;				  
			   }		 
			
		} catch (Exception e) {
			e.getMessage();
		}
		if (!exist) {	
			   user.setDept(departmentsdao.getDepartment(department));
				programsdao.SaveProgram(user);
				model.addAttribute("message", "Program added");
				return "redirect:ManageDepartment.html";				
			}
			else 
			model.addAttribute("message", "Program already exist");
		List<Departments> department1 = departmentsdao.getDepartments();
		model.put("department", department1);
			return "AddProgram";
	}
	
	@RequestMapping(value = "AddAdditionalField.html", method = RequestMethod.GET)
	public String AddAdditionalField1(@ModelAttribute AdditionalField user, ModelMap model) {
		List<Departments> department = departmentsdao.getDepartments();
		model.put("department", department);
		model.put("user", new  AdditionalField());
		return "AddAdditionalField";

	}
	
	@RequestMapping(value = "AddAdditionalField.html", method = RequestMethod.POST)
	public String AddAdditionalField2(@ModelAttribute AdditionalField user, @RequestParam String department, ModelMap model) {
		
		List<AdditionalField> fields = additionalFieldDao.getAdditionalFields(departmentsdao.getDepartment(department).getDept_id());

		Boolean exist = false;
		try {
			  for (AdditionalField entity : fields) {
				  if (entity.getName().equals(user.getName())) {
						exist = true;				
					} else
						exist = false;				  
			   }		 
			
		} catch (Exception e) {
			e.getMessage();
		}
		if (!exist) {	
			   user.setDept(departmentsdao.getDepartment(department));
			   additionalFieldDao.saveAdditionalField(user);
				model.addAttribute("message", "Additional Requirement added");
				return "redirect:ManageDepartment.html";				
			}
			else 
			model.addAttribute("message", "Requirement already exist");
		List<Departments> department1 = departmentsdao.getDepartments();
		model.put("department", department1);
			return "AddAdditionalField";
	}
	
	@RequestMapping(value = "EditDepartment.html", method = RequestMethod.GET)
	public String EditDepartment(ModelMap model, @RequestParam Integer id) {
		model.put("departments", departmentsdao.getDepartment(id));  			
		return "EditDepartment";

	}
	
	@RequestMapping(value = "EditDepartment.html", method = RequestMethod.POST)
	public String EditDepartment(@RequestParam String id,@RequestParam String dptname) {		
		departmentsdao.editDepartment(Integer.parseInt(id),dptname);		
		return "redirect:DepartmentDetail.html?name=" + dptname;
	}
	
	@RequestMapping(value = "DeleteProgram.html")
	public String DeleteProgram(ModelMap model, @RequestParam String dptname, @RequestParam Integer programid ) {
		programsdao.deleteProgram(programid);		
		return "redirect:DepartmentDetail.html?name=" + dptname;

	}
	
	@RequestMapping(value = "DeleteField.html")
	public String DeleteField(ModelMap model, @RequestParam String dptname, @RequestParam Integer fieldid ) {
		additionalFieldDao.deleteField(fieldid);		
		return "redirect:DepartmentDetail.html?name=" + dptname;

	}
	
	@RequestMapping(value = "WelcomeStaff.html", method = RequestMethod.GET)
	public String WelcomeStaff1(ModelMap model, HttpSession session) {
		return "WelcomeStaff";

	}

	

}