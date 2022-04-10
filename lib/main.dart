import 'package:belajar_rest_api/models/user_model.dart';
import 'package:belajar_rest_api/services/user_api_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListUserPage(),
    );
  }
}

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
      ),
      body: FutureBuilder<List<User>>(
        future: UserApiServices().getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(users[index].avatar),
                  ),
                  title: Text(users[index].firstName),
                  subtitle: Text(users[index].email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
