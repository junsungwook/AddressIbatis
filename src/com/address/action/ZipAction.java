package com.address.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.address.config.SqlMapCon;
import com.address.model.ZipcodeVO;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Servlet implementation class ZipAction
 */
@WebServlet("/address/zipAction")
public class ZipAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("zipCheck.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String dong = request.getParameter("dong");
		JSONArray jarr=null;
		SqlMapClient sqlMap = SqlMapCon.getSqlMapInstance();
		try {
			List<ZipcodeVO> arr = sqlMap.queryForList("zipData",dong);
			jarr = new JSONArray();
			for(ZipcodeVO z : arr){
				JSONObject obj = new JSONObject();
				obj.put("zipcode",z.getZipcode());
				obj.put("sido",z.getSido());
				obj.put("gugun",z.getGugun());
				obj.put("dong",z.getDong());
				obj.put("bunji",z.getBunji());
				jarr.add(obj);
				
			}
		} catch (SQLException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jarr.toString());
	}

}
