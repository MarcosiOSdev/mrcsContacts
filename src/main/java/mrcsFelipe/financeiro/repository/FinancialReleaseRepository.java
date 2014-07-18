package mrcsFelipe.financeiro.repository;

import java.util.List;

import mrcsFelipe.financeiro.entity.FinancialRelease;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface FinancialReleaseRepository extends 
				 CrudRepository<FinancialRelease, Integer>,
				 PagingAndSortingRepository<FinancialRelease, Integer>{

	
	@Modifying
	@Query("SELECT fr FROM FinancialRelease fr, User u WHERE fr.user.id = u.id AND u.id = :id")
	public List<FinancialRelease> findAllReleaseByUser(@Param("id")Integer idUser);
	
	
	@Query("SELECT fr FROM FinancialRelease fr ORDER BY fr.id DESC")
	public List<FinancialRelease> findAllReleaseForLimit( Pageable pageable);
	//public List<FinancialRelease> findAllReleaseForLimit(String query, Pageable pageable);
	
	
}
