package com.doc.snip.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.doc.snip.model.CustDocument;

@Repository
public interface DocumentRepository extends CrudRepository<CustDocument, String>{

	@Query("from CustDocument where accNo=?1 and sortCode=?2")
	public Optional<CustDocument> findByAccNoSortCode(String accNo,String sortCode);
}
