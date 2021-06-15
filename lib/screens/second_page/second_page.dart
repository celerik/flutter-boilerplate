// @packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/business_logic/bloc/firebase_state/firebase_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/second_page/add_task.dart';
import 'package:flutter_boilerplate/screens/second_page/list_item.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  Stream<QuerySnapshot> streamsTasks = FirebaseFirestore.instance.collection('tasks').snapshots();
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  TextEditingController newTask = TextEditingController();

  @override
  void dispose() {
    newTask.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseBloc = BlocProvider.of<FirebaseBloc>(context);
    final text = AppLocalizations.of(context);

    Future<void> addTask({required bool isEditing, required String oldTask}) async {
      print(isEditing);
      if (!isEditing) {
        await tasks.add({
          'task_name': newTask.text,
          'creation_date': DateTime.now().millisecondsSinceEpoch,
        }).then((value) {
          showSnackBar(context, text!.task_added, 'success');
          newTask.clear();
        }).catchError((error) {
          showSnackBar(context, error.toString(), 'error');
        });
      } else {
        final result = await tasks.where('task_name', isEqualTo: oldTask).get();
        await tasks.doc(result.docs[0].id).update({'task_name': newTask.text}).then((value) {
          firebaseBloc.add(AddFireBaseState(isEditing: false, text: ''));
          newTask.clear();
          showSnackBar(context, text!.task_edit, 'success');
        }).catchError((error) => showSnackBar(context, error.toString(), 'error'));
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(text!.second_screen),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            BlocBuilder<FirebaseBloc, FirebaseState>(builder: (context, state) {
              return AddTask(
                onPressed: () => addTask(isEditing: state.isEditing, oldTask: state.text),
                newTask: newTask,
                isEditing: state.isEditing,
              );
            }),
            SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: streamsTasks,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(text.something_wrong);
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                return Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      return ListItem(
                        text: (document.data() as Map)['task_name'],
                        rightActions: [
                          IconSlideAction(
                            caption: text.edit,
                            color: Colors.black45,
                            icon: Icons.edit,
                            onTap: () {
                              newTask.text = (document.data() as Map)['task_name'];
                              firebaseBloc.add(
                                AddFireBaseState(isEditing: true, text: newTask.text),
                              );
                            },
                          ),
                          IconSlideAction(
                            caption: text.delete,
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () async {
                              final result = await tasks
                                  .where('task_name',
                                      isEqualTo: (document.data() as Map)['task_name'])
                                  .get();
                              await tasks
                                  .doc(result.docs[0].id)
                                  .delete()
                                  .then((value) =>
                                      showSnackBar(context, text.task_deleted, 'success'))
                                  .catchError(
                                    (error) => showSnackBar(context, error.toString(), 'error'),
                                  );
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
