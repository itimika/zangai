import 'package:flutter/material.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通知の設定"),
      ),
      body: ListView(
        children: const [
          NotificationItem(title: "プッシュ通知"),
          NotificationItem(title: "ショートメール通知"),
          NotificationItem(title: "メール通知"),
          Center(
            child: Text("（このアプリは通知を出しません！）"),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String? title;
  const NotificationItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title!),
          ),
        ),
        Expanded(
          flex: 1,
          child: NotificationSwitch(title: title),
        ),
      ],
    );
  }
}

class NotificationSwitch extends StatefulWidget {
  final String? title;
  const NotificationSwitch({Key? key, required this.title}) : super(key: key);

  @override
  _NotificationSwitchState createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool _on = false;
  void _changeSwitch(bool e) => setState(() => _on = e);

  @override
  Widget build(BuildContext context) {
    return Switch(value: _on, onChanged: _changeSwitch);
  }
}
