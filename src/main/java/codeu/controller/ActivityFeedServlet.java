package codeu.controller;

import codeu.model.data.Conversation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by CostaA17 on 5/16/18.
 */
public class ActivityFeedServlet extends HttpServlet {

    /**
     * This function fires when a user navigates to the conversations page. It gets all of the
     * conversations from the model and forwards to conversations.jsp for rendering the list.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp").forward(request, response);
    }
}
