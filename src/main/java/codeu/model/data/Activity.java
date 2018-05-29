package codeu.model.data;

import java.time.Instant;

/**
 * Created by CostaA17 on 5/18/18.
 */
public class Activity {
    private final String event;
    private final Instant time;
    //other things could be stored in future, such as a url to see it

    public Activity(String event, Instant time) {
        this.event = event;
        this.time = time;
    }

    public String getEvent() {
        return event;
    }

    public Instant getTime() {
        return time;
    }

}
