import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/data/model/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthSource {
  Future<Either> signUp(UserCreationReq userCreationReq);
  Future<Either> signIn(UserSigninReq userSigninReq);
}

class AuthSourceImpl extends AuthSource {
  @override
  Future<Either> signUp(UserCreationReq userCreationReq) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userCreationReq.email,
            password: userCreationReq.password,
          );
      final uId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uId).set({
        'uid': uId,
        'fullName': userCreationReq.fullName,
        'email': userCreationReq.email,
        'createdAt': DateTime.now().toIso8601String(),
        'profileCompleted': userCreationReq.profileCompleted,
      });
      return Right('SignUp Successfully!');
    } on FirebaseAuthException catch (error) {
      String message = "";
      if (error.code == 'weak-Password') {
        message = "The Password provided is too weak";
      } else if (error.code == 'email-already-in-use') {
        message = "An account alreadt exites";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signIn(UserSigninReq userSigninReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSigninReq.email,
        password: userSigninReq.password,
      );
      return Right('Login Successfully!');
    } on FirebaseAuthException catch (error) {
      String message = "";
      if (error.code == 'invalid-email') {
        message = "User Not Found";
      } else if (error.code == 'invalid-credential') {
        message = "Wrong Password";
      }
      return Left(message);
    }
  }
}
