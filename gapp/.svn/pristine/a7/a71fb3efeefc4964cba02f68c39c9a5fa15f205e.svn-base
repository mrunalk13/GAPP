package gapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gapp.model.dao.DepartmentsDao;

@Controller
public class DepartmentsController {

    @Autowired
    private DepartmentsDao departmentDao;

    @RequestMapping("/users.html")
    public String department( ModelMap models )
    {
        models.put( "department", departmentDao.getDepartments());
        return "department";
    }

}