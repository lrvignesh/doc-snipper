package com.doc.snip.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="CUST_DOCUMENT")
public class CustDocument {
	
	@Column(name="ACCNO")
	private String accNo;
	
	@Column(name="SORTCODE")
	private String sortCode;
	
	@Id
	@Column(name="DOC_ID")
	private String documentId;
	
	@Lob
	@Column(name="DOCUMENT")
	private byte[] document;
	
	@Override
	public String toString() {
		return "CustDocument [accNo=" + accNo + ", sortCode=" + sortCode + ", documentId=" + documentId + "]";
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getSortCode() {
		return sortCode;
	}

	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public byte[] getDocument() {
		return document;
	}

	public void setDocument(byte[] document) {
		this.document = document;
	}

	
	

}
