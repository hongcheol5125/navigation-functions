import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 가장 가까운 곳에서 arguments를 가져온다
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three', // pushNamed는 main.dart에서 선언해 준 Key값을 적어주면 된다.
              arguments: 990,
            );
          },
          child: Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                // pushReplacement는 RouteTwo에서 RouteThree로 가는게 아니라 RouteTwo를 RouteThree로 "대체!"하는 것
                MaterialPageRoute(
              builder: (_) => RouteThreeScreen(),
            ));
            // Navigator.of(context).pushReplacementNamed('/three') 해도 pushReplacement와 똑같은 기능!
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(  // pushNamedAndRemoveUntil도 존재!
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
              (route) => false  // <== 이렇게 쓰면 HomeScreen 빼고 다른 페이지들은 삭제
            );
          },
          child: Text('Push And Remove Until'),
        ),
      ],
    );
  }
}
