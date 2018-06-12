package codeu.controller;
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import java.util.List;
import java.util.Arrays;
import java.util.Scanner;

public class AdminServlet extends HttpServlet {

	//Store clas that gives access to Users. 
	private UserStore userStore;

	// set state for request on server
	public void init() throws ServletException {
		super.init();
		setUserStore(UserStore.getInstance());
	}
	
	// set UserStore used by this servlet
	void setUserStore(UserStore userStore) {
		this.userStore = userStore;
	}

	
	@Override
	//this is to check for the users 

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.getRequestDispatcher("/WEB-INF/view/admin.jsp").forward(request, response);

	}
}

	
