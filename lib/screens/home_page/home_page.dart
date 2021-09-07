// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/bloc/to_do_list/to_do_list_bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/blueButton.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';

import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoBloc = ToDoListBloc();
    final callTodoFetch = todoBloc.fetchTodo();
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: HeaderPainter(),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Logo()],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Icon(Icons.logout, color: Colors.white))
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                  width: size.width,
                  height: size.height * 0.76,
                  child: StreamBuilder(
                      stream: todoBloc.todoListStream,
                      builder:
                          (context, AsyncSnapshot<List<TodoList>> snapshot) {
                        var data = snapshot.data;

                        if (!snapshot.hasData) {
                          return Container(
                            child: Center(child: Text(text.loading)),
                          );
                        }
                        return SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data?.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                    leading: Icon(Icons.book),
                                    title: Text(data![index].title),
                                    subtitle: Text(data![index].description),
                                    onTap: () {
                                      /* react to the tile being tapped */
                                    });
                              }),
                        );
                      })),
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
