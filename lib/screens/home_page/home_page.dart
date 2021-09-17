// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/bloc/to_do_list/to_do_list_bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';

import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:flutter_boilerplate/screens/utils/providers/ThemeProvider.dart';
import 'package:flutter_boilerplate/screens/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoBloc = ToDoListBloc();
  final callTodoFetch = ToDoListState();
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    await ToDoListState().fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    final responsive = Responsive.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
        backgroundColor: ThemeProvider().secondaryColor,
      ),
      body: CustomPaint(
        painter: HeaderPainter(),
        child: Container(
          child: Column(
            children: [
              Logo(
                width: responsive.dp(18),
              ),
              SizedBox(
                height: responsive.dp(1.9),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: responsive.dp(3),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              FutureBuilder(
                future: callTodoFetch.fetchTodo(),
                builder: (_, AsyncSnapshot<List<TodoList>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: size.width,
                        height: size.height * 0.76,
                        child: Center(
                          child: Text(text.loading),
                        ),
                      ),
                    );
                  }
                  return Container(
                    width: size.width,
                    height: size.height * 0.76,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Icon(
                            Icons.book,
                            size: responsive.dp(3),
                          ),
                          title: Text(
                            snapshot.data![index].title,
                            style: TextStyle(
                              fontSize: responsive.dp(1.8),
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data![index].description,
                            style: TextStyle(
                              fontSize: responsive.dp(1.6),
                            ),
                          ),
                          onTap: () {
                            /* react to the tile being tapped */
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      final email = await SharedPrefs().getValueFromKey('email');
      final cognitoUser = CognitoUser(email, userPool);
      await cognitoUser.signOut();
      await SharedPrefs().reset();
      await Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      showSnackBar(context, e.toString(), 'success');
    }
  }
}
