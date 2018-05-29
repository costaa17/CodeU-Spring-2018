package codeu.controller;

import codeu.model.store.basic.ActivityFeedStore;
import org.junit.Before;
import org.mockito.Mockito;
import org.junit.Test;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CostaA17 on 5/17/18.
 */

public class ActivityFeedTest {

    private ActivityFeedServlet activityServlet;
    private HttpServletRequest mockRequest;
    private RequestDispatcher mockRequestDispatcher;
    private HttpServletResponse mockResponse;

    private ActivityFeedStore mockStore;

    @Before
    public void setup() {
        activityServlet = new ActivityFeedServlet();
        mockRequest = Mockito.mock(HttpServletRequest.class);
        mockResponse = Mockito.mock(HttpServletResponse.class);
        mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
        Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/activityfeed.jsp"))
                .thenReturn(mockRequestDispatcher);

        mockStore = Mockito.mock(ActivityFeedStore.class);
        activityServlet.setActivityStore(mockStore);
    }

    @Test
    public void testDoGet() throws IOException, ServletException {
        activityServlet.doGet(mockRequest, mockResponse);
        Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
    }

}
