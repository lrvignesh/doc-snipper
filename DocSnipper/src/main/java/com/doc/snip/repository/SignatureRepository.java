package com.doc.snip.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.doc.snip.model.CustSignDocument;

@Repository
public interface SignatureRepository extends CrudRepository<CustSignDocument, String> {

}
