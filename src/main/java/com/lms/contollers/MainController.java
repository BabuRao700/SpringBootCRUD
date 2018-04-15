package com.lms.contollers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.models.Book;
import com.lms.services.LmsService;

@Controller
public class MainController {
	
	@Autowired
	private LmsService lmsService;
	
	@GetMapping("/")
	public String init(HttpServletRequest req) {
		req.setAttribute("Books", lmsService.findAllBooks());
		req.setAttribute("mode", "BOOK_VIEW");
		return "index"; 
	} 
	
	@GetMapping("/updateBook")
	public String init(@RequestParam long id,  HttpServletRequest req) {
		req.setAttribute("book", lmsService.findOneBook(id));
		req.setAttribute("mode", "BOOK_EDIT");
		return "index"; 
	} 
	
	
	/*@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-mm-dd"), false));
	}*/
	
	@RequestMapping(value = {"/save"}, method=RequestMethod.POST)
	public String init(@ModelAttribute("book") Book book, BindingResult bindingResult, HttpServletRequest req) {
		System.out.println(book.getAuthor());
		lmsService.save(book);
		req.setAttribute("Books", lmsService.findAllBooks());
		req.setAttribute("mode", "BOOK_VIEW");
		return "index"; 
	} 
	
	@GetMapping("/newBook")
	public String newBook(HttpServletRequest req) {
		req.setAttribute("mode","BOOK_NEW");
		return "index";
	}
	
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam long id, HttpServletRequest req, HttpServletResponse res) throws IOException {
		lmsService.delete(id);
		req.setAttribute("Books", lmsService.findAllBooks());
		req.setAttribute("mode", "BOOK_VIEW");
		res.sendRedirect("/");
		return "index";
	}
	
}
