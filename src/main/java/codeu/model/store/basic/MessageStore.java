// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.model.store.basic;

import codeu.model.data.Activity;
import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.persistence.PersistentStorageAgent;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Store class that uses in-memory data structures to hold values and automatically loads from and
 * saves to PersistentStorageAgent. It's a singleton so all servlet classes can access the same
 * instance.
 */
public class MessageStore {

  /** Singleton instance of MessageStore. */
  private static MessageStore instance;

  private static ActivityFeedStore activityFeedStore;

  private static UserStore userStore;

  private static ConversationStore conversationStore;
  /**
   * Returns the singleton instance of MessageStore that should be shared between all servlet
   * classes. Do not call this function from a test; use getTestInstance() instead.
   */
  public static MessageStore getInstance() {
    if (instance == null) {
      activityFeedStore = ActivityFeedStore.getInstance();
      instance = new MessageStore(PersistentStorageAgent.getInstance());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
   *
   * @param persistentStorageAgent a mock used for testing
   */
  public static MessageStore getTestInstance(PersistentStorageAgent persistentStorageAgent,
                                             ActivityFeedStore activityFeedStore,
                                             ConversationStore conversationStore,
                                             UserStore userStore) {
    MessageStore inst = new MessageStore(persistentStorageAgent);
    inst.setActivityFeedStore(activityFeedStore);
    inst.setConversationStore(conversationStore);
    inst.setUserStore(userStore);
    return new MessageStore(persistentStorageAgent);

  }

  /**
   * The PersistentStorageAgent responsible for loading Messages from and saving Messages to
   * Datastore.
   */
  private PersistentStorageAgent persistentStorageAgent;

  /** The in-memory list of Messages. */
  private List<Message> messages;

  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private MessageStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    activityFeedStore = ActivityFeedStore.getInstance();
    userStore = UserStore.getInstance();
    conversationStore = ConversationStore.getInstance();
    messages = new ArrayList<>();
  }

  /** Add a new message to the current set of messages known to the application. */
  public void addMessage(Message message) {
    messages.add(message);
    persistentStorageAgent.writeThrough(message);
    User user = userStore.getUser(message.getAuthorId());
    Conversation conversation = conversationStore.getConversation(message.getConversationId());
    if (user != null && conversation != null ) {
      String event = user.getName() + " sent a message to the conversation: <a href= \"/chat/"
              + conversation.getTitle() + "\">" + conversation.getTitle() + "</a>";
      activityFeedStore.addActivity(new Activity(event, Instant.now()));
    }
  }

  /** Access the current set of Messages within the given Conversation. */
  public List<Message> getMessagesInConversation(UUID conversationId) {

    List<Message> messagesInConversation = new ArrayList<>();

    for (Message message : messages) {
      if (message.getConversationId().equals(conversationId)) {
        messagesInConversation.add(message);
      }
    }

    return messagesInConversation;
  }

  /** Sets the List of Messages stored by this MessageStore. */
  public void setMessages(List<Message> messages) {
    this.messages = messages;
  }

  /**
   * Sets the ActivityFeedStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  public void setActivityFeedStore(ActivityFeedStore activityFeedStore) {
    this.activityFeedStore = activityFeedStore;
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  public void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * Sets the ConversationStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  public void setConversationStore(ConversationStore conversationStore) {
    this.conversationStore = conversationStore;
  }
}
