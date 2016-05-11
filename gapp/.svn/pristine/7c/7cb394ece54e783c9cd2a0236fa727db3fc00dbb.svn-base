package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "ApplicationsDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationsDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    ApplicationsDao ApplicationsDao;

    //Test1
    @Test
    public void getAppInDept()
    {
      //  assert ApplicationsDao.getApplications("Accounting","Fall 2016").size() == 1;
    }
    
    //Test2
    @Test
    public void getAppByUser()
    {
      //  assert ApplicationsDao.getApplications("student1@localhost.localdomain").size() == 1;
    }

}