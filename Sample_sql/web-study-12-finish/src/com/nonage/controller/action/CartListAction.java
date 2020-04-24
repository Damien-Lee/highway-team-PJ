package com.nonage.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nonage.dao.CartDAO;
import com.nonage.dto.CartVO;
import com.nonage.dto.MemberVO;

public class CartListAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "mypage/cartList.jsp";

    HttpSession session = request.getSession();
    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
    if (loginUser == null) {
      url = "NonageServlet?command=login_form";
    } else {
      CartDAO cartDAO = CartDAO.getInstance();
      ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getId());

      int totalPrice = 0;
      for (CartVO cartVO : cartList) {
        totalPrice += cartVO.getPrice2() * cartVO.getQuantity();
      }

      request.setAttribute("cartList", cartList);
      request.setAttribute("totalPrice", totalPrice);
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}
