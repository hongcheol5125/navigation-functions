import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // route_two_screen.dart에서 넘겨준 arguments: 990을 받음
    final argument = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route Three',
      children: [
        Text(
          'argument : ${argument}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        )
      ],
    );
  }
}
