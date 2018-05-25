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
		request.getRequestDispatcher("/login").forward(request, response);

	}

 	@Override
        //this checks to see if the user is one of the admins
        public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
                String username = (String) request.getSession().getAttribute("user");
		if (username == null){
			// user is not logged in 
			response.sendRedirect("/login");
			return;
		}
		
		User user = userStore.getUser(username);
		if (user == null) {
			//user not found
			System.out.println("User not found:" + username);
			response.sendRedirect("/login");
			return;
		}
		
                //set accepted names
                //String[] adminNames = {"AlexandriaStorm", "AnaVitoriadoValleCosta", "EmilyArroyo", "GavinLifrieri", "KevinWorkman"};
 		 //check to see if an admin
                //boolean result = Arrays.stream(adminNames).anyMatch(user::equals);
                //if (!result){
                  //      request.setAttribute("error", "That username does not belong to an admin.");
                    //    request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
                        
                      //  return;
               // }

                //request.getSession().setAttribute("user", username);
                response.sendRedirect("/admin");
		//request.getRequestDispatcher("/WEB-INF/view/admin.jsp").forward(request,response);
               
	}
}

	
