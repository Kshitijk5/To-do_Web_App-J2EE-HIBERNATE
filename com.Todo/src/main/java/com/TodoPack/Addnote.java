package com.TodoPack;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entity.NoteEntity;
import com.factory.Factory;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/Addnotes")
public class Addnote extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		try {
			NoteEntity note = new NoteEntity(title, content);
			SessionFactory sf = Factory.getInstance();
			Session session = sf.getCurrentSession();
			session.beginTransaction();
			session.save(note);
			session.getTransaction().commit();
			session.close();
			HttpSession sess = request.getSession();
			sess.setAttribute("info", "Added");
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
