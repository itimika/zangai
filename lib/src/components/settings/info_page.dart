import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("情報"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/secret'),
            title: const Text("利用規約"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/secret'),
            title: const Text("プライバシーポリシー"),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/secret'),
            title: const Text("バージョン"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
