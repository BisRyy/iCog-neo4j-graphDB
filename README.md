# 1. Resume Graph Database

This Cypher script, `resume.cypher`, is used to create a graph database of [my resume](https://drive.google.com/file/d/1Vk0yRdVmkyBcsqHEgUzl5zrnS0pW4GwQ/view?usp=sharing). It uses the Cypher query language to interact with a Neo4j graph database.

## Nodes and Relationships

The script creates nodes for various entities such as Person, University, Company, Project, Skill, and Achievement. It also creates relationships between these nodes to represent the connections between different entities.

## Queries

The script includes several queries to retrieve information from the graph database. These queries can be used to get details about the projects worked on by a person, the skills possessed by a person, the achievements of a person, and the positions held by a person.



# 2. Social Media Application

This Python script, `social-media.py`, is the backend for a simple social network application. It uses the `neo4j` Python driver to interact with a Neo4j graph database.

## Class: SocialNetworkApp

This class represents the main application and has methods to interact with the database.

### Key Methods

- `register_user(self, name, age, location, interests)`: Registers a new user.
- `update_user(self, name, age, location, interests)`: Updates user information.
- `send_friend_request(self, sender, receiver)`: Sends a friend request.
- `accept_friend_request(self, sender, receiver)`: Accepts a friend request.
- `reject_friend_request(self, sender, receiver)`: Rejects a friend request.
- `unfriend(self, user1, user2)`: Unfriends a user.
- `create_post(self, username, content, timestamp)`: Creates a post.
- `like_post(self, username, postId)`: Likes a post.
- `comment_on_post(self, username, postId, text)`: Comments on a post.
- `create_group(self, name, description)`: Creates a group.
- `join_group(self, username, groupName)`: Joins a group.
- `recommend_friends(self, username)`: Recommends friends.
- `search_user(self, searchTerm)`: Searches for a user.

## Example Usage

The script includes an example usage section at the end, demonstrating how to use the various methods of the `SocialNetworkApp` class.

[Instruction Document](https://docs.google.com/document/d/1kPR86p6M5qT3mzaCaM-o_JJhyK-LH8YSmesJGUQa5G8/edit?usp=sharing)