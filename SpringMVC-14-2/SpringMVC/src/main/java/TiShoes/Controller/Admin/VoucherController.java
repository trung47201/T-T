package TiShoes.Controller.Admin;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Voucher;
import TiShoes.Service.Admin.aVoucherService;

@Controller
public class VoucherController {
	private aVoucherService aVoucherService;

	@RequestMapping(value = { "/admin/voucher" })
	public ModelAndView loadVoucher(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/voucher");

		aVoucherService = new aVoucherService();

		String search = request.getParameter("search");
		String code = request.getParameter("code");
		String discount = request.getParameter("discount");
		String limit = request.getParameter("limit-input");
		String start_date = request.getParameter("start-date");
		String end_date = request.getParameter("end-date");
		String description = request.getParameter("description");
		String add_new_voucher = request.getParameter("addnewvoucher");

		if (add_new_voucher != null) {
			if (code != null && discount != null && limit != null && start_date != null && end_date != null
					&& description != null) {
				if (aVoucherService.insert(code, Integer.parseInt(discount), Integer.parseInt(limit),
						getTimestamp_by_string(start_date), getTimestamp_by_string(end_date), description)) {
					mv.addObject("addVoucher", "true");
				} else {
					mv.addObject("addVoucher", "false");
				}
			}
		}
		

		if (search != null) {
			List<Voucher> liVC = aVoucherService.find_voucher_by_string(search);
			if (liVC.size() > 0) {
				mv.addObject("listVoucher", liVC);
				mv.addObject("keyword", search);
			} else {
				mv.addObject("notFound", "true");
				mv.addObject("keyword", search);
			}
		} else {
			List<Voucher> liVC = aVoucherService.getAllVoucher();
			mv.addObject("listVoucher", liVC);
		}

		mv.addObject("voucher", "true");
		mv.addObject("editvoucher", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/voucher/edit-voucher/{id}" })
	public ModelAndView edit_voucher(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/voucher");

		aVoucherService = new aVoucherService();
		
		String search = request.getParameter("search");
		String editvoucher = request.getParameter("editvoucher");
		String save = request.getParameter("save");
		String discount = request.getParameter("discount");
		String limit = request.getParameter("limit-input");
		String start_date = request.getParameter("start-date");
		String end_date = request.getParameter("end-date");
		String description = request.getParameter("description");
		
		if(description != null) {
			description = description.trim();
		}
		if(limit != null) {
			limit = limit.trim();
		}
		if(discount != null) {
			discount = discount.trim();
		}
		
		if(editvoucher == null && save == null) {
			return new ModelAndView("redirect: /SpringMVC/admin/voucher");
		}
		
		if (save != null) {
			if (discount != null && limit != null && start_date != null && end_date != null
					&& description != null) {
				if (aVoucherService.update(Integer.parseInt(id), Integer.parseInt(discount), Integer.parseInt(limit),
						getTimestamp_by_string(start_date), getTimestamp_by_string(end_date), description)) {
					mv.addObject("editVoucher", "true");
					System.out.println("true");
				} else {
					mv.addObject("editVoucher", "false");
					System.out.println("false");
				}
			}
		}
		
		if (search != null) {
			List<Voucher> liVC = aVoucherService.find_voucher_by_string(search);
			if (liVC.size() > 0) {
				mv.addObject("listVoucher", liVC);
				mv.addObject("keyword", search);
			} else {
				mv.addObject("notFound", "true");
				mv.addObject("keyword", search);
			}
		} else {
			List<Voucher> liVC = aVoucherService.getAllVoucher();
			mv.addObject("listVoucher", liVC);
		}
		Voucher vc = aVoucherService.get_voucher_by_id_vc(Integer.parseInt(id));
		
		if(vc != null) {
			mv.addObject("vch", vc);
			mv.addObject("start_date", vc.getStart_date().toString());
			mv.addObject("end_date", vc.getStart_date().toString());
		}

		mv.addObject("voucher", "false");
		mv.addObject("editvoucher", "true");
		
		
		return mv;
	}

	private Timestamp getTimestamp_by_string(String s) {
		String new_strs = s.replace("T", " ");
		new_strs += ":00.00";
		return Timestamp.valueOf(new_strs);
	}
}
