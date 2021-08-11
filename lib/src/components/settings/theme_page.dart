import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/model/theme_model.dart';

final List<String> dummyItem = ["これは", "サンプル", "です"];

class ThemeSettingPege extends StatelessWidget {
  const ThemeSettingPege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("テーマの設定"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 20, bottom: 10),
              child: Card(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "テーマサンプル",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(2),
                        child: _sampleScreen(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "※実際のデザインと僅かに異なる場合があります。",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ThemeModel>(context, listen: false).changeTheme();
              },
              child: Text(
                Provider.of<ThemeModel>(context).getThemeName(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sampleScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample App"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 10, bottom: 3),
                dense: true,
                leading: Icon(
                  Icons.circle,
                  size: 20,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                title: Text(
                  dummyItem[index],
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
