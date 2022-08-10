import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BoardCommentTestFirebaseUser {
  BoardCommentTestFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

BoardCommentTestFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BoardCommentTestFirebaseUser> boardCommentTestFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BoardCommentTestFirebaseUser>(
            (user) => currentUser = BoardCommentTestFirebaseUser(user));
