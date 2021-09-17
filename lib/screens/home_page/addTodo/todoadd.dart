// @packages
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/bloc/to_do_list/to_do_list_bloc.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/models/todolist.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/blueButton.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/custom_input.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';

import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';
import 'package:flutter_boilerplate/screens/utils/responsive.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final callTodoFetch = ToDoListState();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formTodoKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final size = MediaQuery.of(context).size;
    final responsive = Responsive.of(context);

    return Scaffold(
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
                height: responsive.dp(7),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: _formTodoKey,
                  child: Column(
                    children: <Widget>[
                      CustomInput(
                        icon: Icons.title,
                        placeholder: S.of(context).titleTodo,
                        keyboardType: TextInputType.text,
                        textController: _titleController,
                      ),
                      CustomInput(
                        icon: Icons.text_fields,
                        placeholder: text.description,
                        textController: _descriptionController,
                      ),
                      BlueButton(
                        sizeWidth: size.width,
                        text: text.send,
                        onPressed: _addTodo,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addTodo() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    _formTodoKey.currentState!.validate();

    if (checkTextControllers([title, description])) {
      try {
        var response = await callTodoFetch.addTodo(title, description);
        if (response) {
          Navigator.pushNamed(context, '/');
        }
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    }
  }
}
