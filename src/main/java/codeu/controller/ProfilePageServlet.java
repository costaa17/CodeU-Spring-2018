package codeu.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;

/**
 * Created by alexandriastorm on 5/22/18.
  * Updated by alexandriastorm on 6/5/18.
 */
public class ProfilePageServlet extends HttpServlet {


    /** Store class that gives access to Conversations. */
    private ConversationStore conversationStore;

    /** Store class that gives access to Messages. */
    private MessageStore messageStore;

    /** Store class that gives access to Users. */
    private UserStore userStore;


// Establishes ConversationStore using the Servlet
    void setConversationStore(ConversationStore conversationStore) {
       this.conversationStore = conversationStore;
     }

     // Establishes UserStore using the Servlet
     void setUserStore(UserStore userStore) {
      this.userStore = userStore;
}
// Establishes MessageStore using the Servlet
void setMessageStore(MessageStore messageStore) {
   this.messageStore = messageStore;
 }


   /* Set up state for handling profile requests.*/
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setConversationStore(ConversationStore.getInstance());
    setMessageStore(MessageStore.getInstance());
  }

    /**
     * This function fires when a user navigates to a user's profile page. It gets all of the
     * user's information and bio from the model and forwards to profiles.jsp for rendering the list.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/view/profiles.jsp").forward(request, response);
    }
}
