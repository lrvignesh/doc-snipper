package com.doc.snip.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doc.snip.model.CustDocument;
import com.doc.snip.model.CustSignDocument;
import com.doc.snip.service.SignatureService;

@Controller
@RequestMapping("/docSnipper")
public class SignatureController {

	@Autowired
	private SignatureService signService;

	@RequestMapping("/saveSign")
	public ModelAndView saveSignature(@RequestParam MultipartFile sign, CustDocument custDocument) {

		ModelAndView mv = null;
		try {
			byte[] signBytes = sign.getBytes();
			CustSignDocument custSignDocument = new CustSignDocument();
			custSignDocument.setSign(signBytes);
			CustSignDocument savedSign = signService.saveSignature(custSignDocument, custDocument);
			 mv = new ModelAndView("/home.jsp");
			mv.addObject("signId",savedSign.getSignId());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/getSignature")
	public void getSignature(CustSignDocument custSignDocument,HttpServletResponse response) {
		
		response.setContentType("image/tiff");
		Optional<CustSignDocument> signature = signService.getSignature(custSignDocument);
		CustSignDocument custSign = signature.get();
		response.setHeader("Content-Disposition", "attachment; filename="+custSign.getSignId()+".tiff");
		InputStream is = new ByteArrayInputStream(custSign.getSign());
		try {
			IOUtils.copy(is, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
