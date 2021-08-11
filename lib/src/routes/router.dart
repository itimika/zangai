import 'package:flutter/material.dart';
import 'package:sample01/src/common/error_pages.dart';
import 'package:sample01/src/components/account/login_check.dart';
import 'package:sample01/src/components/account/signin_page.dart';
import 'package:sample01/src/components/item/add_item_page.dart';
import 'package:sample01/src/components/item/edit_item_page.dart';
import 'package:sample01/src/components/account/login_page.dart';
import 'package:sample01/src/components/secret.dart';
import 'package:sample01/src/components/settings/account_page.dart';
import 'package:sample01/src/components/settings/help_page.dart';
import 'package:sample01/src/components/settings/info_page.dart';
import 'package:sample01/src/components/settings/notification_page.dart';
import 'package:sample01/src/components/settings/settings_page.dart';
import 'package:sample01/src/components/settings/theme_page.dart';

const String initialPage = '/';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? id = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginCheck());
      /**
       * アイテム
       */
      case '/addItem':
        if (id is String) {
          return MaterialPageRoute(builder: (_) => AddItemPage(docId: id));
        }
        return MaterialPageRoute(builder: (_) => noExistIdErrorPage());
      case '/editItem':
        if (id is String) {
          return MaterialPageRoute(
            builder: (_) => EditItemPage(docId: id),
            fullscreenDialog: true,
          );
        }
        return MaterialPageRoute(builder: (_) => noExistIdErrorPage());
      case '/secret':
        return MaterialPageRoute(
          builder: (_) => const Secret(),
        );
      /**
       * アカウント
       */
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SigninPage());
      /**
       * 設定 
       */
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          fullscreenDialog: true,
        );
      case '/settings/account':
        return MaterialPageRoute(builder: (_) => const AccountSettingPege());
      case '/settings/theme':
        return MaterialPageRoute(builder: (_) => const ThemeSettingPege());
      case '/settings/notification':
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingPage());
      case '/settings/help':
        return MaterialPageRoute(builder: (_) => const HelpPage());
      case '/settings/info':
        return MaterialPageRoute(builder: (_) => const InfoPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
