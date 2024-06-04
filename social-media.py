import os
from neo4j import GraphDatabase

class SocialNetworkApp:

    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def register_user(self, name, age, location, interests):
        with self.driver.session() as session:
            result = session.write_transaction(self._create_user, name, age, location, interests)
            return result

    @staticmethod
    def _create_user(tx, name, age, location, interests):
        query = (
            "CREATE (u:User {name: $name, age: $age, location: $location, interests: $interests}) "
            "RETURN u"
        )
        result = tx.run(query, name=name, age=age, location=location, interests=interests)
        return result.single()

    def update_user(self, name, age, location, interests):
        with self.driver.session() as session:
            result = session.write_transaction(self._update_user, name, age, location, interests)
            return result

    @staticmethod
    def _update_user(tx, name, age, location, interests):
        query = (
            "MATCH (u:User {name: $name}) "
            "SET u.age = $age, u.location = $location, u.interests = $interests "
            "RETURN u"
        )
        result = tx.run(query, name=name, age=age, location=location, interests=interests)
        return result.single()

    def send_friend_request(self, sender, receiver):
        with self.driver.session() as session:
            session.write_transaction(self._send_friend_request, sender, receiver)

    @staticmethod
    def _send_friend_request(tx, sender, receiver):
        query = (
            "MATCH (a:User {name: $sender}), (b:User {name: $receiver}) "
            "MERGE (a)-[:OUTGOING_REQUEST]->(b) "
            "MERGE (b)-[:INCOMING_REQUEST]->(a)"
        )
        tx.run(query, sender=sender, receiver=receiver)

    def accept_friend_request(self, sender, receiver):
        with self.driver.session() as session:
            session.write_transaction(self._accept_friend_request, sender, receiver)

    @staticmethod
    def _accept_friend_request(tx, sender, receiver):
        query = (
            "MATCH (a:User {name: $sender})-[r1:OUTGOING_REQUEST]->(b:User {name: $receiver}) "
            "MATCH (b)-[r2:INCOMING_REQUEST]->(a) "
            "DELETE r1, r2 "
            "MERGE (a)-[:FRIENDS_WITH]->(b) "
            "MERGE (b)-[:FRIENDS_WITH]->(a)"
        )
        tx.run(query, sender=sender, receiver=receiver)

    def reject_friend_request(self, sender, receiver):
        with self.driver.session() as session:
            session.write_transaction(self._reject_friend_request, sender, receiver)

    @staticmethod
    def _reject_friend_request(tx, sender, receiver):
        query = (
            "MATCH (a:User {name: $sender})-[r1:OUTGOING_REQUEST]->(b:User {name: $receiver}) "
            "MATCH (b)-[r2:INCOMING_REQUEST]->(a) "
            "DELETE r1, r2"
        )
        tx.run(query, sender=sender, receiver=receiver)

    def unfriend(self, user1, user2):
        with self.driver.session() as session:
            session.write_transaction(self._unfriend, user1, user2)

    @staticmethod
    def _unfriend(tx, user1, user2):
        query = (
            "MATCH (a:User {name: $user1})-[r:FRIENDS_WITH]-(b:User {name: $user2}) "
            "DELETE r"
        )
        tx.run(query, user1=user1, user2=user2)

    def create_post(self, username, content, timestamp):
        with self.driver.session() as session:
            result = session.write_transaction(self._create_post, username, content, timestamp)
            return result

    @staticmethod
    def _create_post(tx, username, content, timestamp):
        query = (
            "MATCH (u:User {name: $username}) "
            "CREATE (u)-[:POSTED]->(p:Post {content: $content, timestamp: $timestamp}) "
            "RETURN p"
        )
        result = tx.run(query, username=username, content=content, timestamp=timestamp)
        return result.single()

    def like_post(self, username, postId):
        with self.driver.session() as session:
            session.write_transaction(self._like_post, username, postId)

    @staticmethod
    def _like_post(tx, username, postId):
        query = (
            "MATCH (u:User {name: $username}), (p:Post {id: $postId}) "
            "CREATE (u)-[:LIKES]->(p)"
        )
        tx.run(query, username=username, postId=postId)

    def comment_on_post(self, username, postId, text):
        with self.driver.session() as session:
            session.write_transaction(self._comment_on_post, username, postId, text)

    @staticmethod
    def _comment_on_post(tx, username, postId, text):
        query = (
            "MATCH (u:User {name: $username}), (p:Post {id: $postId}) "
            "CREATE (u)-[:COMMENTED_ON {text: $text}]->(p)"
        )
        tx.run(query, username=username, postId=postId, text=text)

    def create_group(self, name, description):
        with self.driver.session() as session:
            result = session.write_transaction(self._create_group, name, description)
            return result

    @staticmethod
    def _create_group(tx, name, description):
        query = (
            "CREATE (g:Group {name: $name, description: $description}) "
            "RETURN g"
        )
        result = tx.run(query, name=name, description=description)
        return result.single()

    def join_group(self, username, groupName):
        with self.driver.session() as session:
            session.write_transaction(self._join_group, username, groupName)

    @staticmethod
    def _join_group(tx, username, groupName):
        query = (
            "MATCH (u:User {name: $username}), (g:Group {name: $groupName}) "
            "CREATE (u)-[:JOIN]->(g)"
        )
        tx.run(query, username=username, groupName=groupName)

    def recommend_friends(self, username):
        with self.driver.session() as session:
            result = session.read_transaction(self._recommend_friends, username)
            return result

    @staticmethod
    def _recommend_friends(tx, username):
        query = (
            "MATCH (u:User {name: $username})-[:FRIENDS_WITH]-(f:User)-[:FRIENDS_WITH]-(fof:User) "
            "WHERE NOT (u)-[:FRIENDS_WITH]-(fof) AND u <> fof "
            "RETURN fof, COUNT(*) AS mutualFriends "
            "ORDER BY mutualFriends DESC"
        )
        result = tx.run(query, username=username)
        return result.data()

    def search_user(self, searchTerm):
        with self.driver.session() as session:
            result = session.read_transaction(self._search_user, searchTerm)
            return result

    @staticmethod
    def _search_user(tx, searchTerm):
        query = (
            "MATCH (u:User) "
            "WHERE u.name CONTAINS $searchTerm OR u.location CONTAINS $searchTerm OR $searchTerm IN u.interests "
            "RETURN u"
        )
        result = tx.run(query, searchTerm=searchTerm)
        return result.data()

# Neo4j credentials
NEO4J_URI = os.environ.get("NEO4J_URI","neo4j+s://a44630ac.databases.neo4j.io")
NEO4J_USERNAME = os.environ.get("NEO4J_USERNAME", "neo4j")
NEO4J_PASSWORD = os.environ.get("NEO4J_PASSWORD", "iObhYcL13jLgBShOLHPUJwWx3FY_Eve72hZK6jVMkxM")
AURA_INSTANCEID = os.environ.get("AURA_INSTANCEID", "a44630ac")
AURA_INSTANCENAME = os.environ.get("AURA_INSTANCENAME", "Instance01")

# Example usage
if __name__ == "__main__":
    app = SocialNetworkApp(NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD)

    # Register a new user
    app.register_user("Alice", 25, "New York", ["reading", "hiking", "coding"])
    app.register_user("Bob", 30, "Beijing", ["reading", "hiking", "gaming"])

    # Update user information
    app.update_user("Alice", 26, "San Francisco", ["reading", "hiking", "coding"])

    # Send a friend request
    app.send_friend_request("Alice", "Bob")
    app.send_friend_request("Bob", "Alice")

    # Accept a friend request
    app.accept_friend_request("Alice", "Bob")

    # Reject a friend request
    app.reject_friend_request("Bob", "Alice")

    # Unfriend a user
    app.unfriend("Alice", "Bob")

    # Create a post
    app.create_post("Alice", "Hello world!", "2023-05-15T12:34:56Z")

    # Like a post
    app.like_post("Alice", 1)

    # Comment on a post
    app.comment_on_post("Alice", 1, "Nice post!")

    # Create a group
    app.create_group("Hiking Enthusiasts", "A group for people who love hiking")

    # Join a group
    app.join_group("Alice", "Hiking Enthusiasts")

    # Recommend friends
    print(app.recommend_friends("Alice"))

    # Search for a user
    print(app.search_user("New York"))

    app.close()
