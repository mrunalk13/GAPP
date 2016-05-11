package gapp.model.dao;

import java.util.Date;
import java.util.List;

import gapp.model.Applications;
import gapp.model.Departments;
import gapp.model.Status;

public interface ApplicationsDao {

    List<Applications> getApplications(String Department,String Term);
    List<Applications> getApplications(String username);
    Applications getApplication(Integer id);
    Applications saveApplication(Applications application);
    void submitApplication(Status status, Date submitted_date, Integer id);
}