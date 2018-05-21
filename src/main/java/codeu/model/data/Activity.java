package codeu.model.data;

/**
 * Created by CostaA17 on 5/18/18.
 */
public class Activity {
    private final String event;
    //other things could be stored in future, such as time/date of event and a url to see it

    public Activity(String event) {
        this.event = event;
    }

    public String getEvent() {
        return event;
    }

}
