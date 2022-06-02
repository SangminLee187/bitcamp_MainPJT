package com.mvc.forrest.controller.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.forrest.service.domain.Product;
import com.mvc.forrest.service.product.ProductService;





@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	public ProductService productService;
	
	//@GetMapping("/addProductTest")
	public String addProductTest() {
		return "storage/addStorage";
	}
	
	//@RequestMapping("addProduct")
	public String addProduct(@ModelAttribute("product") Product product) throws Exception {
		
		product.setWidth(2);
		product.setLength(2);
		product.setHeight(2);
		product.setUserId("user05@naver.com");
		product.setProdName("test");
		product.setProdQuantity(1);
		product.setProdDetail("굳~~");
		product.setCategory("텐트");
		product.setReturnAddress("TEST");
		product.setProdImg("tq.jpg");
		
		productService.addProduct(product);
		
		System.out.println("addProduct:" + product);
		
		return null;
	}

}