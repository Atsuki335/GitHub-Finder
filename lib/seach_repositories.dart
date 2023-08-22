import 'package:flutter/material.dart';
import 'package:githubfinder/item.dart';
import 'package:githubfinder/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textEditingControllerProvider =
    Provider((ref) => TextEditingController());

class SearchRepositories extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ref.watch(textEditingControllerProvider);
    final reposAsyncValue = ref.watch(repositoryProvider(_controller.text));

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
                child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  SizedBox(
                      height: 50,
                      width: 280,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "リポジトリを検索する",
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.search)),
                        controller: _controller,
                      )),
                  Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    height: 50,
                    width: 70,
                    child: ElevatedButton(
                        child: Text(
                          "検索",
                          style: TextStyle(fontSize: 19),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 49, 48, 48)),
                        onPressed: () {
                          ref.refresh(repositoryProvider(_controller.text));
                        }),
                  ),
                ],
              ),
              Expanded(
                  child: reposAsyncValue.when(
                      data: (repos) {
                        return ListView.builder(
                            itemCount: repos.length,
                            itemBuilder: (context, index) {
                              //githubAPIから返ってくるリポジトリを入れる
                              return ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(repos[index].avatarUrl)),
                                  title: Text(repos[index].name),
                                  subtitle: Text(''));
                            });
                      },
                      loading: () => CircularProgressIndicator(),
                      error: (err, _) => Text('エラー: $err')))
            ]))));
  }
}
