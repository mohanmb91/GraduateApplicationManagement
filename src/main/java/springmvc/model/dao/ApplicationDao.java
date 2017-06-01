package springmvc.model.dao;
import java.util.List;

import springmvc.model.AdditionalDepartmentfeildvalues;
import springmvc.model.Application;
import springmvc.model.Department;
import springmvc.model.Status;
import springmvc.model.UserRole;
public interface ApplicationDao {
List<Application> getApplications();
Application getApplicationById(Integer id);

Application saveApplication(Application application);

public List<Application> getApplicationsByProgId(int progId);

AdditionalDepartmentfeildvalues saveFieldValues(AdditionalDepartmentfeildvalues feildValue);

Status getStatusById(Integer id);
}
