import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/common/widgets.dart';
import 'package:sample01/src/model/user_model.dart';

class EditItemPage extends StatelessWidget {
  final String docId;
  const EditItemPage({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentReference doc = FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<UserModel>(context).user.uid)
        .collection('items')
        .doc(docId);
    final _detailNode = FocusNode();
    bool _isBlank = false;

    return Scaffold(
      appBar: appBar,
      body: FutureBuilder<DocumentSnapshot>(
        future: doc.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            final _initTitle = data['title'];
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _initTitle,
                        decoration: const InputDecoration(label: Text("title")),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "必須項目です！";
                          }
                          if (value.length >= 140) {
                            return "140字以内で入力してください";
                          }
                          return null;
                        },
                        onChanged: (value) async {
                          if (value.isNotEmpty) {
                            await doc.update({'title': value});
                            if (_isBlank) {
                              _isBlank = true;
                            }
                          } else {
                            await doc.update({'title': _initTitle});
                            _isBlank = true;
                          }
                        },
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_detailNode),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        minLines: 10,
                        maxLines: null,
                        focusNode: _detailNode,
                        decoration: const InputDecoration(
                          label: Text("detail"),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero)),
                        ),
                        keyboardType: TextInputType.multiline,
                        initialValue: data['detail'],
                        onChanged: (value) async =>
                            await doc.update({'detail': value}),
                        // onFieldSubmitted: (_) => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const Text("loading");
        },
      ),
    );
  }
}
