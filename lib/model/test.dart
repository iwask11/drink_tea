import 'package:drink_tea/db/provider/TeaShowChoseText_provider.dart';
import 'package:drink_tea/db/provider/TeaShow_provider.dart';
import 'package:drink_tea/db/utill.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Future futureTeaShow;

  void initState() async{
    super.initState();
    TeaShowProvider teaShowProvider = TeaShowProvider();
    // await teaShowProvider.insert(TeaShow_add01);
    // await teaShowProvider.insert(TeaShow_add02);
    // await teaShowProvider.insert(TeaShow_add03);
    // await teaShowProvider.insert(TeaShow_add04);
    // await teaShowProvider.insert(TeaShow_add05);
    // await teaShowProvider.insert(TeaShow_add06);
    // await teaShowProvider.insert(TeaShow_add07);
    // await teaShowProvider.update(TeaShow_update01,"tea_id","1");
    await teaShowProvider.queryTableBySingleField("tea_id","1");
    // await teaShowProvider.queryTableAll();
    // await teaShowProvider.getTableCount();
    // await teaShowProvider.deleteBySingleField("tea_id","7");
    // await teaShowProvider.dropTable();
    TeaShowChoseTextProvider teaShowChoseTextProvider = TeaShowChoseTextProvider();
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add01);
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add02);
    // await teaShowChoseTextProvider.insert(TeaShowChoseText_add03);
    // await teaShowChoseTextProvider.update(TeaShowChoseText_update01,"chose_id","c003");
    await teaShowChoseTextProvider.queryTableBySingleField("chose_id","c002");
    // await teaShowChoseTextProvider.queryTableAll();
    // await teaShowChoseTextProvider.getTableCount();
    // await teaShowChoseTextProvider.deleteBySingleField("chose_id","c002");
    // await teaShowChoseTextProvider.dropTable();
    futureTeaShow = teaShowChoseTextProvider.queryTableAll();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Demo"),),
        body: Center(
          child: FutureBuilder(
            future: futureTeaShow,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}