package codeu.controller;

import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import codeu.model.data.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by alexandriastorm on 5/22/18.
 * Servlet that handles /profile/<user> path. Returns the profile of a user
 */
public class ProfilePageServlet extends HttpServlet {

    /**
     * Store class that gives access to Users.
     */
    private UserStore userStore;


    // Establishes UserStore using the Servlet
    void setUserStore(UserStore userStore) {
        this.userStore = userStore;
    }


    /* Set up state for handling profile requests.*/
    @Override
    public void init() throws ServletException {
        super.init();
        setUserStore(UserStore.getInstance());
    }

    /**
     * This function fires when a user navigates to a user's profile page. It gets all of the
     * user's information and bio from the model and forwards to profiles.jsp for rendering the list.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String requestUrl = request.getRequestURI();
        String userTitle = requestUrl.substring("/profile/".length());

        User user = userStore.getUser(userTitle);

        if (user == null){
            // cannot find user with name, redirect to profile list:
            System.out.println("User was null: " + userTitle);
            response.sendRedirect("/profiles");
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
    }

    /**
     * This function fires when a user submits the form on the chat page. It gets the logged-in
     * username from the session, the conversation title from the URL, and the chat message from the
     * submitted form data. It creates a new Message from that data, adds it to the model, and then
     * redirects back to the chat page.
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = (String) request.getSession().getAttribute("user");
        if (username == null) {
            // user is not logged in, don't let them add a message
            response.sendRedirect("/login");
            return;
        }

        User user = userStore.getUser(username);
        if (user == null) {
            // user was not found, don't let them add a message
            response.sendRedirect("/login");
            return;
        }

        String requestUrl = request.getRequestURI();
        String friendUsername = requestUrl.substring("/profile/".length());

        user.addFriend(friendUsername);
        response.sendRedirect("/profile/" + friendUsername);
    }
}
