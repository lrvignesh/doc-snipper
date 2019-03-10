/*
CREATE TABLE CUST_DOCUMENT (
	ACCNO VARCHAR2(10),
	SORTCODE VARCHAR2(6),
	DOC_ID VARCHAR2(50),
	DOCUMENT BLOB
);
*/


insert into CUST_DOCUMENT(ACCNO,SORTCODE,DOC_ID,DOCUMENT) VALUES('1111111111','222222','D-5670022',FILE_READ('E:/Vignesh/Learnings/Workspaces/Office Project Demos/Doc Snipper/DocSnipper/src/main/resources/pdf/CustDocument.pdf'));

