package kr.green.weather.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.weather.vo.RoleVO;

public interface RoleDAO {
	
	RoleVO 	selectById(String cemail);
	List<RoleVO>  selectByRoleList();
	void	insertRole(RoleVO roleVO);
	void	updateRole(RoleVO roleVO);
	void	delRole(@Param("cemail") String cemail);
	
}
