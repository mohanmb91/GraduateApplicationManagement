package springmvc.model.dao;

import java.util.List;

import springmvc.model.Staff;
import springmvc.model.User;

public interface StaffDao {
	Staff saveStaff(Staff staff);
	List<Staff> getStaffs();
	Staff getStaff( Integer id );
}
