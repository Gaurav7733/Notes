package com.servelet;

import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Help.factor;
import com.Note.Notes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s=factor.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Notes note=(Notes)s.get(Notes.class, noteId);
			s.delete(note);		
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
