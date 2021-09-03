// @packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

// @scripts
import 'package:flutter_boilerplate/business_logic/bloc/basic_state/basic_state_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<BasicStateBloc>(context);
    final text = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(text!.second_screen),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.second_screen, style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () => calculatorBloc.add(AddNumber()),
              child: Text(text.increment),
            ),
            BlocBuilder<BasicStateBloc, BasicState>(builder: (context, state) {
              return Text('Counter: ${state.number}',
                  style: TextStyle(fontSize: 20));
            }),
          ],
        ),
      ),
    );
  }
}
