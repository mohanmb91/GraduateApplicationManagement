package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.*;
import springmvc.model.dao.StaffDao;

@Repository
public class StaffDaiImpl implements  StaffDao{

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public Staff saveStaff(Staff staff) {
		// TODO Auto-generated method stub
		return entityManager.merge(staff);
	}
    
	 @Override
	    public List<Staff> getStaffs()
	    {
	        return entityManager.createQuery( "from Staff order by id", Staff.class )
	            .getResultList();
	    }

	@Override
	public Staff getStaff(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find( Staff.class, id );
	}

}
