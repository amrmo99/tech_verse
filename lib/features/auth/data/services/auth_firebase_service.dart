import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:session7test/features/auth/data/models/login_data.dart';
import 'package:session7test/features/auth/data/models/register_data.dart';
import 'package:session7test/utils/constants.dart';
import 'package:session7test/utils/data/models/user.dart';

class AuthFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  Future<User> register(RegisterData registerModel) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerModel.email,
      password: registerModel.password,
    );
    await userCredential.user?.sendEmailVerification();
    final uId = userCredential.user!.uid;
    final userModel = User(
      id: uId,
      firstName: registerModel.firstName,
      lastName: registerModel.lastName,
      email: registerModel.email,
    );
    await _usersCollection.doc(uId).set(userModel.toJson());
    return userModel;
  }

  Future<User> login(LoginData loginData) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.email,
      password: loginData.password,
    );
    if (userCredential.user!.emailVerified) {
      final uId = userCredential.user!.uid;
      final docSnapShot = await _usersCollection.doc(uId).get();
      final userModel = User.fromJson(docSnapShot.data()!);
      return userModel;
    } else {
      throw Exception("Email not verified");
    }
  }

  Future<void> logout() => FirebaseAuth.instance.signOut();

  Future<void> requestPasswordReset(String email) =>
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  bool getAuthStatus() => FirebaseAuth.instance.currentUser != null;
}
