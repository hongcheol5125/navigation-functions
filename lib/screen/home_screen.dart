import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 안드로이드에서 시스템자체로 뒤로가기 버튼 누를 때 onWilPop:(){}이 true면 가능 false면 불가능!
    return WillPopScope(
      onWillPop: () async{
        // true - pop 가능
        // false - pop 불가능
        // canPop을 이용하여 canPop이 true면 뒤로가기 가능, false면 뒤로가기 불가능하게 만들 수 있다!(pop버튼은 막을 수 없음)
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
          // maybePop은 canPop의 값이 true일 때에만 뒤로 갈 수 있다!
          ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());  //canPop은 앞에 페이지가 있을 땐 true를 print한다.
            },
            child: Text('CanPop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();  // 앞에 페이지 없으면 "까만화면" 나옴
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();  // maybePop은 canPop의 값이 true일 때에만 뒤로 갈 수 있다!
            },
            child: Text('MaybePop'),
          ),
          ElevatedButton(
            // pop 했을 때 여기서 값을 받으려면 async, final result = await 를 써주면 된다
            onPressed: () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                        number: 123,
                      )));
              print(result);
            },
            child: Text('Push'),
          )
        ],
      ),
    );
  }
}
