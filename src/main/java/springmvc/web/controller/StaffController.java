package springmvc.web.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import springmvc.model.AdditionalDepartmentFeilds;
import springmvc.model.Application;
import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.Staff;
import springmvc.model.Student;
import springmvc.model.User;
import springmvc.model.UserRole;
import springmvc.model.dao.ApplicationDao;
import springmvc.model.dao.DepartmentsDao;
import springmvc.model.dao.ProgramDao;
import springmvc.model.dao.StaffDao;
import springmvc.model.dao.StudentDao;
import springmvc.model.dao.UserDao;
import springmvc.model.dao.jpa.StaffDaiImpl;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


@Controller
@SessionAttributes({"staff"})
public class StaffController {
	
	@Autowired
	private StaffDao staffDao;	
	
	@Autowired
	private DepartmentsDao departmentDao;
	
	@Autowired
	private ApplicationDao applicationDao;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping(value = "/staff/staffhome.html", method = RequestMethod.GET)
	public String staffHomeGet(@RequestParam Integer staffId,ModelMap models) {
		
		Staff staff = staffDao.getStaff(staffId);
		
		Department staffDepartment = departmentDao.getDepartmentById(staff.getDepartment().getId());
		
		List<Program> programs = staffDepartment.getPrograms();
		
		List<Application> applications = applicationDao.getApplications();
		List<Application> filteredApplications = new ArrayList<>();
		for(Application eachApplication: applications){
			if( programs.contains(eachApplication.getProgram())){
				filteredApplications.add(eachApplication);				
			}
		}
		
		models.put("applications", filteredApplications);
		models.put("staff", staff);
		
		return "/staff/staffhome";
	}
	@RequestMapping(value = "/staff/viewApplication.html", method = RequestMethod.GET)
	public String staffViewApplicationGet(@RequestParam Integer staffId,@RequestParam Integer applicationId,ModelMap models) {
		Application application = applicationDao.getApplicationById(applicationId);
		Staff staff = staffDao.getStaff(staffId);
		models.put("application", application);
		models.put("staff", staff);
		return "staff/viewApplication";
	}
	@RequestMapping(value = "/staff/acceptApplication.html", method = RequestMethod.GET)
	public String staffacceptApplicationGet(@RequestParam Integer staffId,@RequestParam Integer applicationId,ModelMap models) {
		Application application = applicationDao.getApplicationById(applicationId);
		Staff staff = staffDao.getStaff(staffId);
		application.setStatus(applicationDao.getStatusById(3));
		applicationDao.saveApplication(application);
		return "redirect:staffhome.html?staffId="+staff.getId();
	}
	@RequestMapping(value = "/staff/rejectApplication.html", method = RequestMethod.GET)
	public String staffrejectApplicationGet(@RequestParam Integer staffId,@RequestParam Integer applicationId,ModelMap models) {
		Application application = applicationDao.getApplicationById(applicationId);
		Staff staff = staffDao.getStaff(staffId);
		application.setStatus(applicationDao.getStatusById(2));
		applicationDao.saveApplication(application);
		return "redirect:staffhome.html?staffId="+staff.getId();
	}
}
