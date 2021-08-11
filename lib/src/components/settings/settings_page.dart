import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/settings/account'),
            leading: const Icon(Icons.person),
            title: const Text("アカウント"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/settings/theme'),
            leading: const Icon(Icons.color_lens),
            title: const Text("テーマ"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/settings/notification'),
            leading: const Icon(Icons.notifications),
            title: const Text("通知"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/settings/help'),
            leading: const Icon(Icons.help),
            title: const Text("ヘルプ"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/settings/info'),
            leading: const Icon(Icons.info_rounded),
            title: const Text("情報"),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Text(
              "Sample App",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("これはアプリ開発練習用のアプリです。"),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              onPressed: () {},
              // onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text("ログイン"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              onPressed: () {},
              // onPressed: () => Navigator.pushNamed(context, '/signin'),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "サインイン",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              onPressed: () async {
                // await FirebaseAuth.instance.signOut();
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   '/',
                //   (route) => false,
                // );
                // showMySnackBar(context, 'ログアウトしました');
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ログアウト",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
