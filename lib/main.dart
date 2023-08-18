import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _message = '';
  final controller = TextEditingController();

  void _apply() {
    setState(() {
      _message = controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GitHub Finder',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 49, 48, 48),
        ),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 49, 48, 48),
              title: Text(
                'GitHub Finder',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
                child: Column(
              children: [
                Padding(padding: EdgeInsets.all(80)),
                Text(
                  'リポジトリを検索する',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "関連する言葉を入力して下さい",
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.search)),
                      controller: controller,
                    )),
                Padding(padding: EdgeInsets.all(20)),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      child: Text(
                        "検索",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 49, 48, 48)),
                      onPressed: _apply),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(_message),
                )
              ],
            ))));
  }
}
