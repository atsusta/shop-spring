package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ProductService;
import vo.Product;
import vo.ProductPage;

/**
 * 상품 정보 보기에 관련된 기능
 * 
 * @author 표길우
 *
 */
@Controller
public class ProductController {
	private ProductService productService;

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	/**
	 * 첫 화면 상품 보기
	 * product.do -> 송, 민
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public ModelAndView getProductView(String page, String category,
			HttpServletRequest request) {
		int requestPage = 1;
		if (page != null && page.length() > 0) {
			requestPage = Integer.parseInt(page);
		}

		ProductPage productPage = productService.getProductPage(requestPage,
				category);

		System.out.println("products loaded...");
		
		request.getSession().setAttribute("category", category);
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("product");
		modelAndView.addObject("productPage", productPage);
		modelAndView.addObject("requestPage", requestPage);

		// content view name
		modelAndView.addObject("mainContent", "list.jsp");
		modelAndView.addObject("category", category);

		return modelAndView;
	}

	/**
	 * 상품 상세 정보 보기
	 * productDetail.do -> 송, 민
	 */
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public ModelAndView getProductDetailView(int productNo, 
			HttpServletRequest request) {
		Product product = productService.getProduct(productNo);

		System.out.println("product: " + product);
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("product");
		modelAndView.addObject("product", product);
		modelAndView.addObject("category", request.getSession().getAttribute("category"));

		// content view name
		modelAndView.addObject("mainContent", "product_detail.jsp");

		return modelAndView;
	}

}
