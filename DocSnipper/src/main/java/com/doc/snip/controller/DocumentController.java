package com.doc.snip.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doc.snip.model.CustDocument;
import com.doc.snip.service.DocumentService;

@Controller
@RequestMapping("/docSnipper")
public class DocumentController {

	@Autowired
	private DocumentService docService;

	@RequestMapping(value = "/getCustomerDoc", method = RequestMethod.POST)
	public ModelAndView getCustomerDoc(CustDocument custDocument) {

		Optional<CustDocument> customerDocDetails = docService.findCustomerDoc(custDocument);
		System.out.println("Fetched Customer Details " + customerDocDetails);

		ModelAndView mv = new ModelAndView();

		if (customerDocDetails.isPresent()) {
			mv.setViewName("/documentDetails.jsp");
			mv.addObject("customerDocDetails", customerDocDetails.get());

			byte[] encode = Base64.getEncoder().encode(customerDocDetails.get().getDocument());
			String encodedString = new String(encode);

			mv.addObject("encodedString", encodedString);
		} else {
			String errorMessage = "No Details Found. Please check again";
			boolean isError = true;

			Map<String, String> modelMap = new HashMap<>();
			modelMap.put("searchType", "Doc");
			modelMap.put("isError", String.valueOf(isError));
			modelMap.put("errorMessage", errorMessage);
			mv.setViewName("/home.jsp");
			mv.addAllObjects(modelMap);
		}

		return mv;

	}

	/*
	 * @RequestMapping(value = "/fetchDocument", produces = { "application/pdf" })
	 * public @ResponseBody byte[] fetchDocument(String docId, HttpSession session)
	 * {
	 * 
	 * CustDocument custDoc = (CustDocument)
	 * session.getAttribute("CustomerDocument");
	 * session.removeAttribute("CustomerDocument"); return custDoc.getDocument();
	 * 
	 * }
	 */

}
