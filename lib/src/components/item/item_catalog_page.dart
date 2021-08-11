import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:sample01/src/model/user_model.dart';

class ItemCatalogPage extends StatelessWidget {
  const ItemCatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference items = FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<UserModel>(context).user.uid)
        .collection('items');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample App"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: items.orderBy('date').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> docs = snapshot.data!.docs;
            return ListView(
              children: docs.map(
                (doc) {
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/editItem',
                        arguments: doc.id,
                      ),
                      leading: Icon(
                        Icons.circle,
                        color: Colors.primaries[doc['color']],
                      ),
                      title: Text(doc['title']),
                      trailing: IconButton(
                        onPressed: () async {
                          await items.doc(doc.id).delete();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          } else {
            return const Center(
              child: RiveAnimation.asset(
                'assets/pencil.riv',
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          String id = items.doc().id;
          Navigator.pushNamed(
            context,
            '/addItem',
            arguments: id,
          );
          final date = DateTime.now().toLocal().toIso8601String();
          await items.doc(id).set({
            'title': '',
            'detail': '',
            'color': Random().nextInt(Colors.primaries.length),
            'date': date,
          });
        },
      ),
    );
  }
}
