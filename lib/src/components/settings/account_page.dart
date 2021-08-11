import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/model/user_model.dart';

class AccountSettingPege extends StatelessWidget {
  const AccountSettingPege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? _user = Provider.of<UserModel>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text("アカウントの情報"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('ユーザID'),
              subtitle: Text(_user.uid),
            ),
            ListTile(
              title: const Text('サインイン日時'),
              subtitle: Text(_user.metadata.creationTime.toString()),
            ),
            ListTile(
              title: const Text('最終ログイン日時'),
              subtitle: Text(_user.metadata.lastSignInTime.toString()),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'アカウントはアプリ初回起動時に自動的に作成されています。',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
