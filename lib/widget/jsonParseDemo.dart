import 'package:flutter/material.dart';
import 'package:lucidplus_interview_task/Provider/Providerclass.dart';
import 'package:provider/provider.dart';
import '../JsonParse/users.dart';

class JsonParseDemo extends StatefulWidget {
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _user;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderClass>(context).getUsers().then((user) {
      _user = user;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(ProviderClass.isLoading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        child: ProviderClass.isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)),
              )
            : ListView.builder(
                itemCount: null == _user ? 0 : _user.length,
                itemBuilder: (context, index) {
                  User user = _user[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            user.id.toString(),
                          ),
                        ),
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                }),
      ),
    );
  }
}
