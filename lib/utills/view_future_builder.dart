import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///封装futureBuilder，统一创建错误界面和等待界面
class ViewFutureBuilder<T> extends StatefulWidget {
  const ViewFutureBuilder({
    Key? key,
    required this.future,
    required this.view,
  }) : super(key: key);

  final Future future;
  final Widget view;

  @override
  State<ViewFutureBuilder<T>> createState() => _ViewFutureBuilderState<T>();
}
class _ViewFutureBuilderState<T> extends State<ViewFutureBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Text(snapshot.data);
        }
        // 错误界面
        if (snapshot.hasError) {
          return errorView(snapshot.error);
        }
        // 默认加载图
        if (loadingView != null) {
          return loadingView();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
  Widget errorView(Object? error) {return Text('$error');}
  Widget loadingView(){return Text('loading...');}
}