package com.TodoPack;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entity.NoteEntity;
import com.factory.Factory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Updatee")
public class Update extends HttpServlet {


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("ide"));
		int id = Integer.parseInt(request.getParameter("ide"));
//		System.out.println(id);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		try {
			NoteEntity note = new NoteEntity();
			SessionFactory sf = Factory.getInstance();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			note = session.get(NoteEntity.class,id );
			note.setContent(content);
			note.setTitle(title);
			session.update(note);
			session.getTransaction().commit();
//			session.close();
			HttpSession sess = request.getSession();
			sess.setAttribute("info", "Updated");
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			System.err.println(e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
