package com.doc.snip.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.doc.snip.model.CustDocument;
import com.doc.snip.repository.DocumentRepository;

@Component
public class DocumentService {
	
	@Autowired
	private DocumentRepository docRepository;
	
	@Transactional
	public Optional<CustDocument> findCustomerDoc(CustDocument custDocument) {
		return docRepository.findByAccNoSortCode(custDocument.getAccNo(), custDocument.getSortCode());
	}
	
}
