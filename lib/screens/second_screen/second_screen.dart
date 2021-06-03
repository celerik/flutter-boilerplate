// @packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// @scripts
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/business_logic/bloc/basic_state/basic_state_bloc.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/carousel.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/selectable_icons.dart';

// @const_variables
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  var var1 = false;

  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<BasicStateBloc>(context);
    final text = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(text!.second_screen),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text.second_screen, style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () => calculatorBloc.add(AddNumber()),
              child: Text(text.increment),
            ),
            BlocBuilder<BasicStateBloc, BasicState>(builder: (context, state) {
              return Text('Counter: ${state.number}', style: TextStyle(fontSize: 20));
            }),
            CarouselWidget(
              key: Key('carouselAttempt'),
              imgList: imgList,
              carouselCircles: CarouselCircles(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                selectedColor: Colors.red,
                unSelectedColor: Colors.black12,
                boxShape: BoxShape.circle,
              ),
              carouselCardContent: Text(
                'No image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SelectableIcon(
              icon: Icons.ac_unit_rounded,
              backgroundColor: Colors.black38,
              iconColor: Colors.red,
              onSelectedColor: Color(0xff68D194),
              height: 100,
              width: 100,
              iconSize: 50,
              onTap: () => setState(() => var1 = !var1),
              isPressed: var1,
            ),
          ],
        ),
      ),
    );
  }
}
