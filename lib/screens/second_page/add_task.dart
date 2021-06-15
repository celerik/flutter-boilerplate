// @packages
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/input_text.dart';
import 'package:flutter_boilerplate/config/colors/colors.dart';

class AddTask extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController newTask;
  final bool isEditing;

  const AddTask({
    Key? key,
    required this.onPressed,
    required this.newTask,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InputText(
          labelString: !isEditing ? text!.new_task : text!.edit_task,
          backgroundColor: CustomColors().white,
          borderColor: CustomColors().inputBorder,
          labelStyle: TextStyle(color: CustomColors().inputLabel),
          controller: newTask,
          textStyle: TextStyle(color: CustomColors().black),
          height: 50,
          width: MediaQuery.of(context).size.width - 50,
        ),
        IconButton(
          icon: Icon(!isEditing ? Icons.add_circle_outline_sharp : Icons.edit, size: 30),
          onPressed: onPressed,
        )
      ],
    );
  }
}
