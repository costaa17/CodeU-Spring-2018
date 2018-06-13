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
 */
public class ProfilePageServlet extends HttpServlet {


    /**
     * Store class that gives access to Conversations.
     */
    private ConversationStore conversationStore;

    /**
     * Store class that gives access to Messages.
     */
    private MessageStore messageStore;

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


        // Otherwise, they are looking for the profile of a particular user
        // We will render the profile page for said user, given by profile.jsp (as opposed to profiles.jsp)
        User user = userStore.getUser(userTitle);

        if (user == null){
            // cannot find user with name, redirect to homepage:
            System.out.println("User was null: " + userTitle);
            response.sendRedirect("/");
        }

        request.setAttribute("user", user);
        request.setAttribute("users", UserStore.getInstance().getUsersList());
        request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
    
        




    }
}
