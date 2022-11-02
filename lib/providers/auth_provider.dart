import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

   Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
 Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
  // googleSignIn() async {
  //   try {
  //     await _auth.signInWithProvider(provider) ;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dating_app/models/user_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../utils/firestore_constans.dart';

// enum Status {
//   uninitialized,
//   authenticated,
//   authenticating,
//   authenticateError,
//   authenticateCanceled,
// }

// class AuthProvider extends ChangeNotifier {
//   final GoogleSignIn googleSignIn;
//   final FirebaseFirestore firebaseFirestore;
//   final FirebaseAuth firebaseAuth;
//   final SharedPreferences prefs;

//   Status _status = Status.uninitialized;
//   Status get status => _status;

//   AuthProvider(
//       {required this.googleSignIn,
//       required this.firebaseAuth,
//       required this.firebaseFirestore,
//       required this.prefs});

//   String? getFirebaseUserId() {
//     return prefs.getString(FirestoreConstants.id);
//   }

//   Future<bool> isLoggedIn() async {
//     bool isLoggedIn = await googleSignIn.isSignedIn();
//     if (isLoggedIn &&
//         prefs.getString(FirestoreConstants.id)?.isNotEmpty == true) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> handleGoogleSignIn() async {
//     _status = Status.authenticating;
//     notifyListeners();

//     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       User? firebaseUser =
//           (await firebaseAuth.signInWithCredential(credential)).user;

//       if (firebaseUser != null) {
//         final QuerySnapshot result = await firebaseFirestore
//             .collection(FirestoreConstants.pathUserCollection)
//             .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
//             .get();
//         final List<DocumentSnapshot> document = result.docs;
//         if (document.isEmpty) {
//           firebaseFirestore
//               .collection(FirestoreConstants.pathUserCollection)
//               .doc(firebaseUser.uid)
//               .set({
//             FirestoreConstants.displayName: firebaseUser.displayName,
//             FirestoreConstants.photoUrl: firebaseUser.photoURL,
//             FirestoreConstants.id: firebaseUser.uid,
//             "createdAt: ": DateTime.now().millisecondsSinceEpoch.toString(),
//             FirestoreConstants.chattingWith: null
//           });

//           User? currentUser = firebaseUser;
//           await prefs.setString(FirestoreConstants.id, currentUser.uid);
//           await prefs.setString(
//               FirestoreConstants.displayName, currentUser.displayName ?? "");
//           await prefs.setString(
//               FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
//           await prefs.setString(
//               FirestoreConstants.phoneNumber, currentUser.phoneNumber ?? "");
//         } else {
//           DocumentSnapshot documentSnapshot = document[0];
//           ChatUser userChat = ChatUser.fromDocument(documentSnapshot);
//           await prefs.setString(FirestoreConstants.id, userChat.id);
//           await prefs.setString(
//               FirestoreConstants.displayName, userChat.displayName);
//           await prefs.setString(FirestoreConstants.aboutMe, userChat.aboutMe);
//           await prefs.setString(
//               FirestoreConstants.phoneNumber, userChat.phoneNumber);
//         }
//         _status = Status.authenticated;
//         notifyListeners();
//         return true;
//       } else {
//         _status = Status.authenticateError;
//         notifyListeners();
//         return false;
//       }
//     } else {
//       _status = Status.authenticateCanceled;
//       notifyListeners();
//       return false;
//     }
//   }

//   Future<void> googleSignOut() async {
//     _status = Status.uninitialized;
//     await firebaseAuth.signOut();
//     await googleSignIn.disconnect();
//     await googleSignIn.signOut();
//   }

  
// }
