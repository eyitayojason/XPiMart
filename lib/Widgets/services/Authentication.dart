import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xd/Screens/LoginScreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:xd/Screens/ProfilePage.dart';
import 'package:xd/Screens/LoginPage.dart';

class Authentication with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _success;
  String _userEmail;
  Future<FirebaseUser> signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: LoginPage.emailController.text,
      password: LoginPage.passwordController.text,
    ))
        .user;
    if (user != null) {
      _success = true;
      _userEmail = user.email;
    } else {
      _success = false;
    }
    print(user.phoneNumber);
    notifyListeners();
  }

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    notifyListeners();

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    if (user != null) {
      print("signed in " + user.displayName);
      return user;
    } else {}

    return user;
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Sign Out");
  }

  void showspinner() {
    LoginScreen.showSpinner = true;

    notifyListeners();
  }

  void stopSpinner() {
    LoginScreen.showSpinner = false;
    notifyListeners();
  }

  Future<Null> login() async {
    final FacebookLogin facebookSignIn = FacebookLogin();
    notifyListeners();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
   Logged in!
      
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
    notifyListeners();
  }

  Future<Null> logOut() async {
    final FacebookLogin facebookSignIn = FacebookLogin();
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
    notifyListeners();
  }

  void _showMessage(String message) {
    String message = 'Log in/out by pressing the buttons below.';

    message = message;
    notifyListeners();
  }

  void dropDownValue(String newValue) {
    DropDownVertical.dropdownValue = newValue;
    notifyListeners();
  }

  notifyListeners();
}
