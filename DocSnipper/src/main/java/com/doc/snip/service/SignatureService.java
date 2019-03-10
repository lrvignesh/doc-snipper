package com.doc.snip.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.doc.snip.model.CustDocument;
import com.doc.snip.model.CustSignDocument;
import com.doc.snip.repository.SignatureRepository;

@Component
public class SignatureService {

	@Autowired
	private SignatureRepository signRepository;
	
	@Transactional
	public CustSignDocument saveSignature(CustSignDocument custSignDocument, CustDocument custDocument) {
		custSignDocument.setCustDocument(custDocument);
		return signRepository.save(custSignDocument);
	}
	
	public Optional<CustSignDocument> getSignature(CustSignDocument custSignDocument){
		return signRepository.findById(custSignDocument.getSignId());
	}
}
