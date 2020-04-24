package com.nonage.admin.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nonage.controller.action.Action;
import com.nonage.dao.WorkerDAO;

public class AdminLoginAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String url = "NonageServlet?command=admin_login_form";
    String msg = "";
    String workerId = request.getParameter("workerId").trim();
    String workerPwd = request.getParameter("workerPwd").trim();

    WorkerDAO workerDAO = WorkerDAO.getInstance();

    int result = workerDAO.workerCheck(workerId, workerPwd);
    
    if (result == 1) {// 로그인 성공
      HttpSession session = request.getSession();
      session.setAttribute("workerId", workerId);
      url = "NonageServlet?command=admin_product_list";
    } else if (result == 0) {
      msg = "비밀번호를 확인하세요.";
    } else if (result == -1) {
      msg = "아이디를 확인하세요.";
    }
    request.setAttribute("message", msg);
    request.getRequestDispatcher(url).forward(request, response);
  }
}
