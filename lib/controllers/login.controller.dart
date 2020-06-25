import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todos/user.dart';

class LoginController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    //pegasr dados da conta do usuario no google
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

//pegar autenticação do user no google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

//Pegar credentiais do user no google
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    //passando credenciais do google para o Firebase
    final FirebaseUser firebaseUser =
        (await _auth.signInWithCredential(credential)).user;

    //obter token
    var token = await firebaseUser.getIdToken();

    //prenchendo usuario com dados do Firebase usando variavel global
    user.name = firebaseUser.displayName;
    user.email = firebaseUser.email;
    user.picture = firebaseUser.photoUrl;
    user.token = token.token;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    user = new IUser();
  }
}
