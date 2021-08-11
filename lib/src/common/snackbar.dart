import 'package:flutter/material.dart';

showMySnackBar(BuildContext context, String title) {
  final snackBar = SnackBar(
      content: Text(title),
      action: SnackBarAction(label: 'Undo', onPressed: () {}));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
