import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyAppはStatelessWidgetのままで問題ありません
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimeDisplayPage(),
    );
  }
}

// 現在時刻を表示し、更新する機能を持つStatefulWidget
class TimeDisplayPage extends StatefulWidget {
  @override
  _TimeDisplayPageState createState() => _TimeDisplayPageState();
}

class _TimeDisplayPageState extends State<TimeDisplayPage> {
  // 現在時刻を保持する変数
  String _currentTime = '';

  // initStateメソッドで初期化時に現在時刻を設定
  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  // 現在時刻を更新するメソッド
  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = '${now.hour}:${now.minute}:${now.second}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text(
              'Current Time:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _currentTime, // 現在時刻を表示
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateTime, // ボタンが押されたときに時刻を更新
              child: const Text('Update Time'),
            ),
          ],
        ),
      ),
    );
  }
}
