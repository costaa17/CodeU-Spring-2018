package codeu.controller;

import codeu.model.data.Activity;
import codeu.model.store.basic.ActivityFeedStore;
import codeu.model.store.basic.UserStore;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CostaA17 on 5/16/18.
 */
public class ActivityFeedServlet extends HttpServlet {

    ActivityFeedStore activityStore;

    /**
     * Set up state for handling registration-related requests. This method is only called when
     * running in a server, not when running in a test.
     */
    @Override
    public void init() throws ServletException {
        super.init();
        setActivityStore(ActivityFeedStore.getInstance());
        System.out.println("hello");
    }

    /**
     * This function fires when a user navigates to the activity feed page.
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        //Activity a = new Activity("hello world");
        //activityStore.addActivity(a);
        List<Activity> l = activityStore.getFeed();
        System.out.println(l.size());
        for (Activity n : l) {
            System.out.println(n.getEvent());
        }
        request.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp").forward(request, response);
    }

    public void setActivityStore(ActivityFeedStore activityStore) {
        this.activityStore = activityStore;
    }

}
