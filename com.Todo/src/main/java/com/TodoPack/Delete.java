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
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int noteId = Integer.parseInt(request.getParameter("id"));
		System.out.println("Note id is :-"+noteId);
		SessionFactory sf = Factory.getInstance();
		Session session = sf.getCurrentSession();
		try {
		session.beginTransaction();
		NoteEntity note = session.get(NoteEntity.class, noteId);
		session.delete(note);
		session.getTransaction().commit();
		session.close();
		HttpSession sss = request.getSession();
		sss.setAttribute("info","Deleted");
//		sss.invalidate();
//	sss.removeAttribute(getServletName());
		response.sendRedirect("index.jsp");
		}catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
