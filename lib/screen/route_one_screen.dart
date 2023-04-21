import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({
     this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One',
      children: [
        Text(
          'arguments: ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        // maybePop은 canPop의 값이 true일 때에만 뒤로 갈 수 있다!
        ElevatedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: Text('CanPop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: Text('MaybePop'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteTwoScreen(),
                  settings: RouteSettings(
                    arguments: 789,
                  ),
                ),
              );
            },
            child: Text('Push'))
      ],
    );
  }
}
