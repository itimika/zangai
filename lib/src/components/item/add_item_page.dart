import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample01/src/common/widgets.dart';
import 'package:sample01/src/model/user_model.dart';

class AddItemPage extends StatelessWidget {
  final String docId;
  const AddItemPage({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentReference doc = FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<UserModel>(context).user.uid)
        .collection('items')
        .doc(docId);
    final _detailNode = FocusNode();
    bool titleIsEmpty = true;

    Future<bool> _willPopCallBack() async {
      if (titleIsEmpty) {
        await doc.delete();
      }
      return true;
    }

    return WillPopScope(
      onWillPop: _willPopCallBack,
      child: Scaffold(
        appBar: appBar,
        body: FutureBuilder<DocumentSnapshot>(
          future: doc.get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          decoration:
                              const InputDecoration(label: Text("title")),
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
                              titleIsEmpty = false;
                            } else {
                              titleIsEmpty = true;
                            }
                            await doc.update({'title': value});
                          },
                          onFieldSubmitted: (value) =>
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
                          onChanged: (value) async {
                            await doc.update({'detail': value});
                          },
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
      ),
    );
  }
}
