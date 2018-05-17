package codeu.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CostaA17 on 5/16/18.
 */
public class ActivityFeedServlet extends HttpServlet {

    /**
     * This function fires when a user navigates to the activity feed page.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp").forward(request, response);
    }

}
