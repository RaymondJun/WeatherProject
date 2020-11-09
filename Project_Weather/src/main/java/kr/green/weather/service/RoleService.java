package kr.green.weather.service;

import java.util.List;

import kr.green.weather.vo.RoleVO;

public interface RoleService {
	
	List<RoleVO>  selectByRoleList();
	RoleVO 	selectById(String cemail);
	void	insertRole(RoleVO roleVO);
	void	updateRole(RoleVO roleVO);
	void	delRole(String cemail);
}
