import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;



Future<User?> signIn(String email ,String password)async{
  var user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  return user.user;


}

Future<User?> signUp(String email, password,)async{
  var user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  await _firestore.collection("Users").doc(user.user?.uid).set({
 "email":email,
 "password":password,
 "outLoan":0,
 "currentLoan":0



  });

  return user.user;

}
Future<User?> updatePassword(String password,)async{
  User? firebaseUser =  firebaseAuth.currentUser;
  firebaseUser?.updatePassword(password);
  
  return firebaseUser;
}

Future<User?> updateEmail(String email,)async{
  User? firebaseUser =  firebaseAuth.currentUser;
  FirebaseAuth.instance.currentUser?.updateEmail(email);
  
  return firebaseUser;
}



}