/*
*
*
* Author Name: Crystal Cuthinho	
* 
* Filename: AddUserController.java	
* 	
* Classes used by code: AddUserService, CheckRoleService,FileUploadValidator,DirectoryService
* 
* Tabes used: Loader_schema.loader,User_schema.userdetails,User_schema.personal_profile,User_schema.professional_profile,User_schema.qualification
* 
* Description: This controller is used to add users via an uploaded csv file
* 
* Functions: indexjsp(), addUser() 		
*
*/


package org.crce.interns.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.crce.interns.exception.IncorrectFileFormatException;
import org.crce.interns.exception.MaxFileSizeExceededError;
import org.crce.interns.model.FileUpload;
import org.crce.interns.service.AddUserService;
import org.crce.interns.service.CheckRoleService;
import org.crce.interns.service.DirectoryService;
import org.crce.interns.validators.FileUploadValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AddUserController {
	
	@Autowired
	private AddUserService addUserService;
	@Autowired
	private CheckRoleService crService;
	
	@Autowired
    FileUploadValidator validator;
	
    @Autowired
    private DirectoryService directoryService;
        
    // this function is used to navigate to AddUserViaCSV.jsp    
	@RequestMapping(value="/addUser", method = RequestMethod.GET)
	public ModelAndView indexjsp(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String role =  (String)session.getAttribute("roleId");
		if(!crService.checkRole("AddUser", role))
			return new ModelAndView("403");
		else
			return new ModelAndView("AddUserViaCSV");
	}


	//this function is used to call the AddUserService to actually upload the file 
	@RequestMapping( value = "/uploadFile", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request,@RequestParam CommonsMultipartFile fileUpload, @ModelAttribute("fileUpload1") FileUpload fileUpload1,BindingResult result)
			throws Exception {

			
		ModelAndView model = new ModelAndView("AddUserViaCSV");
		try {
						
			//boolean flag = false;
			fileUpload1.setFile(fileUpload);
			System.out.println(fileUpload1.getFile().getSize());
			validator.validate(fileUpload1, result);
			if (fileUpload1.getFile().getSize() == 0) {
				System.out.println("Error in form");
	            
	            return new ModelAndView("AddUserViaCSV");
			}
			String userName = request.getSession().getAttribute("userName").toString();
			System.out.println("");
			addUserService.handleFileUpload(request,fileUpload,userName);
			model.addObject("success", 1);
			// loadCopyFile("user_schema.userdetails");
			directoryService.createStudentFolder();
			// returns to the same index page	
			
		} catch (IncorrectFileFormatException e) {
			
			System.out.println(e);
			model.addObject("error", 1);
			
			
		} catch (MaxFileSizeExceededError m) {
			
			System.out.println(m);
			model.addObject("error1", 1);
			
		}
		
		return model;	
		}

        

}
