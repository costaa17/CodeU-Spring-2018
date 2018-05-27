package codeu.model.store.basic;

import codeu.model.data.Activity;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.time.Instant;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class ActivityFeedStoreTest {

    private ActivityFeedStore activityFeedStore;
    private PersistentStorageAgent mockPersistentStorageAgent;

    private final Activity ACTIVITY =
            new Activity("test activity", Instant.parse("2018-05-23T08:10:56.124Z"));

    @Before
    public void setup() {
        activityFeedStore = Mockito.mock(ActivityFeedStore.class);

        mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
        activityFeedStore = ActivityFeedStore.getTestInstance(mockPersistentStorageAgent);

    }

    @Test
    public void testAddActivity() {

        activityFeedStore.addActivity(ACTIVITY);
        Activity result = activityFeedStore.getFeed().get(0);

        assertEquals(ACTIVITY, result);
        Mockito.verify(mockPersistentStorageAgent).writeThrough(ACTIVITY);
    }

    private void assertEquals(Activity expectedActivity, Activity actualActivity) {
        Assert.assertEquals(expectedActivity.getEvent(), actualActivity.getEvent());
        Assert.assertEquals(expectedActivity.getTime(), actualActivity.getTime());
    }
}
