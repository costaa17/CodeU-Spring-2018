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

package codeu.model.data;

import codeu.model.store.basic.UserStore;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/** Class representing a registered user. */
public class User {
  private final UUID id;
  private final String name;
  private final String passwordHash;
  private final Instant creation;
  private Set<String> friends;
  private UserStore userStore;

  /**
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param passwordHash the password hash of this User
   * @param creation the creation time of this User
   * @param friends a set with the usernames of the users friends
   */
  public User(UUID id, String name, String passwordHash, Instant creation, Set<String> friends) {
    this.id = id;
    this.name = name;
    this.passwordHash = passwordHash;
    this.creation = creation;
    this.friends = friends;
    userStore = UserStore.getInstance();
  }

  /**
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param passwordHash the password hash of this User
   * @param creation the creation time of this User
   */
  public User(UUID id, String name, String passwordHash, Instant creation) {
    this(id, name, passwordHash, creation, new HashSet<>());
  }

  /** Returns the ID of this User. */
  public UUID getId() {
    return id;
  }

  /** Returns the username of this User. */
  public String getName() {
    return name;
  }
  
  /** Returns the password hash of this User. */
  public String getPasswordHash() {
    return passwordHash;
  }

  /** Returns the creation time of this User. */
  public Instant getCreationTime() {
    return creation;
  }

  /** Returns a set with the usernames of this User's friends. */
  public Set<String> getFriends() {
    return friends;
  }

  /**
   * Adds friend with given id if User with given id exists
   *
   * @param username the username of the friend to be added
   */
  public void addFriend(String username) {
      if (userStore.getUser(id) != null) {
        friends.add(username);
      }
  }

  /**
   * Removes friend with given id if exists
   *
   * @param username the username of the friend to be added
   */
  public void removeFriend(String username) {
      friends.remove(username);
  }

  /**
   * Returns true if user has a friend with the given id and false otherwise
   *
   * @param username the username of the friend to be added
   */
  public boolean isFriend(String username) {
      return friends.contains(username);
  }

}
