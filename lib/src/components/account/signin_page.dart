import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample01/src/common/snackbar.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final _passwordFocusNode = FocusNode();
    final _key = GlobalKey<FormState>();
    String? _mailaddress;
    String? _password;

    return Scaffold(
      appBar: AppBar(title: const Text("新規登録")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("メールアドレス"),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  onSaved: (value) {
                    _mailaddress = value;
                  },
                ),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("パスワード"),
                  ),
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                OutlinedButton(
                  onPressed: () async {
                    _key.currentState!.save();
                    try {
                      final UserCredential userCredential =
                          await auth.signInWithEmailAndPassword(
                        email: _mailaddress!,
                        password: _password!,
                      );
                      final User user = userCredential.user!;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                      showMySnackBar(context, 'ログインしました');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showMySnackBar(
                            context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showMySnackBar(
                            context, 'Wrong password provided for that user.');
                      } else {
                        showMySnackBar(context, 'エラー');
                      }
                    }
                  },
                  child: const Text("新規登録"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
