package com.nonage.admin.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.controller.action.Action;
import com.nonage.dao.OrderDAO;
import com.nonage.dto.OrderVO;

public class AdminOrderListAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "admin/order/orderList.jsp";
    String key = "";
    if (request.getParameter("key") != null) {
      key = request.getParameter("key");
    }

    OrderDAO orderDAO = OrderDAO.getInstance();
    ArrayList<OrderVO> orderList = orderDAO.listOrder(key);

    request.setAttribute("orderList", orderList);

    request.getRequestDispatcher(url).forward(request, response);
  }
}
