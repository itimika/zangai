import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/configs/locale.dart';
import 'package:sample01/src/model/theme_model.dart';
import 'package:sample01/src/routes/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // デバッグバナー消す
      debugShowCheckedModeBanner: false,
      // テーマの設定
      theme: Provider.of<ThemeModel>(context).setMyTheme(),
      // 言語設定
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [locale],
      // 画面遷移設定
      initialRoute: initialPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
