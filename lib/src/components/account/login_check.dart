import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/components/item/item_catalog_page.dart';
import 'package:sample01/src/components/secret.dart';
import 'package:sample01/src/model/user_model.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserModel user, _) {
        switch (user.status) {
          case Status.uninitialized:
            return const Secret();
          case Status.unauthenticated:
          case Status.authenticating:
            user.signInAnonymously();
            return const Secret();
          case Status.authenticated:
            return const ItemCatalogPage();
        }
      },
    );
  }
}
