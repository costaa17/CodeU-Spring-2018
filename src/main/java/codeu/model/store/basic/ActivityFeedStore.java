package codeu.model.store.basic;

import codeu.model.data.Activity;
import codeu.model.data.User;
import codeu.model.store.persistence.PersistentStorageAgent;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by CostaA17 on 5/18/18.
 */
public class ActivityFeedStore {
    /* Singleton instance of ActivityFeedStore. */
    private static ActivityFeedStore instance;

    /**
     * Returns the singleton instance of UserStore that should be shared between all servlet classes.
     * Do not call this function from a test; use getTestInstance() instead.
     */
    public static ActivityFeedStore getInstance() {
        if (instance == null) {
            instance = new ActivityFeedStore(PersistentStorageAgent.getInstance());
            System.out.println("oh");
        }
        return instance;
    }

    /**
     * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
     *
     * @param persistentStorageAgent a mock used for testing
     */
    public static ActivityFeedStore getTestInstance(PersistentStorageAgent persistentStorageAgent) {
        return new ActivityFeedStore(persistentStorageAgent);
    }

    /**
     * The PersistentStorageAgent responsible for loading the feed from and saving feed to Datastore.
     */
    private PersistentStorageAgent persistentStorageAgent;

    /** The in-memory list of Activity events. */
    private List<Activity> activities;

    /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
    private ActivityFeedStore(PersistentStorageAgent persistentStorageAgent) {
        this.persistentStorageAgent = persistentStorageAgent;
        activities = new ArrayList<>();
    }

    /**
     * Access the User object with the given name.
     *
     * @return null if username does not match any existing User.
     */
    public List<Activity> getFeed() {
        return activities;
    }

    /**
     * Sets the List of Users stored by this UserStore. This should only be called once, when the data
     * is loaded from Datastore.
     */
    public void setActivities(List<Activity> activities) {
        this.activities = activities;
    }
    /**
     * Add a new user to the current set of users known to the application. This should only be called
     * to add a new user, not to update an existing user.
     */
    public void addActivity(Activity activity) {
        activities.add(activity);
        persistentStorageAgent.writeThrough(activity);
    }

}
