package dogwalk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.DogDao;
import dogwalk.model.Dog;

public class DogProfileList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 9;
		int pagePerBlock = 5;
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		DogDao dd = DogDao.getInstance();
		List<Dog> list = dd.list(startRow, endRow);
		
		int tot = dd.total();
		int total = tot - startRow + 1;
		int startPage = currentPage - (currentPage - 1) % 5;
		int endPage = startPage + pagePerBlock - 1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) {
			endPage = totPage;
		}
		
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		
		return "profile/dogProfileList";
	}
}