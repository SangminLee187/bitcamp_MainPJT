package com.mvc.forrest.controller.storage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.forrest.common.utils.FileNameUtils;
import com.mvc.forrest.common.utils.FileUtils;
import com.mvc.forrest.config.auth.LoginUser;
import com.mvc.forrest.service.coupon.CouponService;
import com.mvc.forrest.service.domain.OwnCoupon;
import com.mvc.forrest.service.domain.Page;
import com.mvc.forrest.service.domain.Product;
import com.mvc.forrest.service.domain.Search;
import com.mvc.forrest.service.domain.Storage;
import com.mvc.forrest.service.domain.User;
import com.mvc.forrest.service.product.ProductService;
import com.mvc.forrest.service.storage.StorageService;
import com.mvc.forrest.service.user.UserService;





@Controller
@RequestMapping("/storage/*")
public class StorageController {
	
	@Autowired
	public StorageService storageService ;
	
	@Autowired
	public ProductService productService ;
	
	@Autowired
	public UserService userService;
	
	@Autowired
	public CouponService couponService;
	
	@Autowired
	public FileUtils fileUtils;
	
	
	
	public StorageController() {
		System.out.println(this.getClass());
	}

	@Value("5")
	int pageUnit;
	
		
	
	//보관 메인화면 단순 네비게이션
	@GetMapping("storageMain")
	public String storageMain() throws Exception  {
		
		return "storage/storageMain";
	}
	
	//보관물품등록을 위한 페이지로 네비게이션
	//회원, 어드민 가능
	@GetMapping("addStorage")
	public String addStorageGet(Model model) throws Exception {

		//암호화된 유저아이디를 받아옴
		LoginUser loginUser= (LoginUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId= loginUser.getUser().getUserId();
		
		//회원의 보유쿠폰리스트를 받아옴
		Map<String,Object> map =couponService.getOwnCouponList(userId);
		
		//결제가 이루어지기전에 tranNo가 필요하기때문에 예비 tranNo를 생성 
		 String reserveTranNo = FileNameUtils.getRandomString();
	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reserveTranNo", reserveTranNo);
	
		return "storage/addStorage";
	}
	
	

	//회원, 어드민 가능
	@PostMapping("addStorage")
	public String addStoragePost(@ModelAttribute("product") Product product,
												@ModelAttribute("storage") Storage storage,
												@ModelAttribute("ownCoupon") OwnCoupon ownCoupon,
												@RequestParam("uploadFile") List<MultipartFile> uploadFile,
												@RequestParam("paymentNo") String paymentNo,
												 Model model) throws Exception {
		
		
		//결제완료후 사용한 쿠폰 삭제, 쿠폰이 선택되지않았을때는 삭제메서드 동작X
		if(ownCoupon.getOwnCouponNo() != 0) {
			couponService.deleteOwnCoupon(ownCoupon.getOwnCouponNo());
			
		}
		
		//암호화된 유저아이디를 받아옴
		LoginUser loginUser= (LoginUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId= loginUser.getUser().getUserId();

        
		//랜덤으로 생성한 prodNo(db에 들어가기전 prodNo가 필요)
         String prodNo = FileNameUtils.getRandomString();
        
        //product에 필요한값 셋팅후 등록
		product.setUserId(userId);
		product.setProdNo(prodNo);
		
		//////////이미지업로드
		String prodImg = 	fileUtils.uploadFiles(uploadFile, prodNo, "product");
		
		//대표사진업로드
		product.setProdImg(prodImg);
		
		productService.addProduct(product);
		
		
		//storage에 필요한값 셋팅후 등록
		storage.setUserId(userId);
		storage.setProdNo(prodNo);
		storage.setPaymentNo(paymentNo);
		storage.setProdImg(prodImg);
		//storage.setPaymentNo(paymentWay);
		storageService.addStorage(storage);
		
		model.addAttribute("storage", storage);
		
		return "forward:/storage/getStorage";
	}
	
	//회원, 어드민 가능
	@RequestMapping("listStorage")
	public String listStorage(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		int pageSize = 5;
		
		search.setPageSize(pageSize);
		
		//암호화된 userId를 받아옴
		LoginUser loginUser= (LoginUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId= loginUser.getUser().getUserId();

		
		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("userId", userId);
		
		Map<String, Object> mapStorage = storageService.getStorageList(map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)mapStorage.get("totalCount")).intValue(), pageUnit, pageSize );
		
		model.addAttribute("list", mapStorage.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		/////////////////////////////////////세션 재설정(상민)/////////////////////////////////////////
		User user = userService.getUser(userId);
		user = userService.getUser(user.getUserId());
		SecurityContextHolder.clearContext();
		LoginUser freshUser = new LoginUser(user);
		Authentication newAuthentication = new UsernamePasswordAuthenticationToken(
				freshUser, null, freshUser.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		///////////////////////////////////////////////////////////////////////////////

		
		return "storage/listStorage";
	}
	
	
	//admin만 접근가능
	@RequestMapping("listStorageForAdmin")
	public String listStorageForAdmin(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		//더좋은 방법이 있을듯
		//전체 보관물품을 볼때 SearchProductCondition을 null로 만들기위한코드
		if(search.getSearchProductCondition() == "") {
			search.setSearchProductCondition(null);
		}
		
		if(search.getSearchKeyword() == "") {
			search.setSearchKeyword(null);
		}
		
		if(search.getSearchCondition() == "") {
			search.setSearchCondition(null);
		}
		
		int pageSize = 10;
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = storageService.getStorageListForAdmin(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize );
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "storage/listStorageForAdmin";
	}
	
	//회원, 어드민 가능
	@GetMapping("extendStorage")
	public String extendStorageGet(@RequestParam("tranNo") String tranNo, Model model) throws Exception {
		
		//암호화된 유저아이디를 받아옴
		LoginUser loginUser= (LoginUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId= loginUser.getUser().getUserId();
		
		//결제가 이루어지기전에 tranNo가 필요하기때문에 예비 tranNo를 생성 
		 String reserveTranNo = FileNameUtils.getRandomString();
				
		//회원의 보유쿠폰리스트를 받아옴
		Map<String,Object> map =couponService.getOwnCouponList(userId);
		
		model.addAttribute("storage", storageService.getStorage(tranNo));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reserveTranNo", reserveTranNo);
		
		return "storage/extendStorage";
	}
	

	//회원, 어드민 가능
	@RequestMapping("getStorage")
	public String getStorage(@RequestParam("tranNo") String tranNo, Model model) throws Exception {
		
		if(tranNo == null) {
			return  "storage/storageMain";
		}
		
		model.addAttribute("storage", storageService.getStorage(tranNo));

		return "storage/getStorage";
	}
	

}