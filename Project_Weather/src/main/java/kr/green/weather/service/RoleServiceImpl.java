package kr.green.weather.service;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.weather.dao.RoleDAO;
import kr.green.weather.vo.RoleVO;
import lombok.extern.slf4j.Slf4j;

@Service("roleService")
@XmlRootElement
@Slf4j
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleDAO roleDAO;
	
	@Override
	public List<RoleVO> selectByRoleList() {
		log.debug("+=========================================================================");
		log.debug("RoleServiceImpl.selectByRoleList 호출 cemail 은 : ");
		log.debug("+=========================================================================");
		return roleDAO.selectByRoleList();
	}
	@Override
	public RoleVO selectById(String cemail) {
		log.debug("+=========================================================================");
		log.debug("RoleServiceImpl.selectById 호출 cemail 은 : " + cemail);
		log.debug("+=========================================================================");
		return roleDAO.selectById(cemail);
	}

	@Override
	public void insertRole(RoleVO roleVO) {
		log.debug("+=========================================================================");
		log.debug("RoleServiceImpl.insertRole 호출 roleVO 은 : " + roleVO);
		log.debug("+=========================================================================");
		roleDAO.insertRole(roleVO);
	}

	@Override
	public void updateRole(RoleVO roleVO) {
		log.debug("+=========================================================================");
		log.debug("RoleServiceImpl.updateRole 호출 roleVO 은 : " + roleVO);
		log.debug("+=========================================================================");
		roleDAO.updateRole(roleVO);
	}

	@Override
	public void delRole( String cemail) {
		log.debug("+=========================================================================");
		log.debug("RoleServiceImpl.delRole 호출 cemail 은 : " + cemail);
		log.debug("+=========================================================================");
		roleDAO.delRole(cemail);
		
	}

	

}
