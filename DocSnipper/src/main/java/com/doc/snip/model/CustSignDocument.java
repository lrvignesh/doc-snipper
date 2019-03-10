package com.doc.snip.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="CUST_SIGN")
public class CustSignDocument {

	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name="system-uuid", strategy = "uuid")
	@Column(name="SIGN_ID")
	private String signId;
	
	
	@OneToOne
	@JoinColumn(name="DOC_ID",referencedColumnName="DOC_ID")
	private CustDocument custDocument;
	
	@Lob
	@Column(name="SIGN")
	private byte[] sign;

	public String getSignId() {
		return signId;
	}

	public void setSignId(String signId) {
		this.signId = signId;
	}

	public CustDocument getCustDocument() {
		return custDocument;
	}

	public void setCustDocument(CustDocument custDocument) {
		this.custDocument = custDocument;
	}

	public byte[] getSign() {
		return sign;
	}

	public void setSign(byte[] sign) {
		this.sign = sign;
	}
	
	
	
}
