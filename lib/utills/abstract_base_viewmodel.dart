import 'package:flutter/cupertino.dart';

///所有viewModel的父类，提供共同的公共功能
///来自author:liuhc
abstract class BaseViewModel {
  bool _isFirst = true;

  bool get isFirst => _isFirst;

  ///判断是否初始化是，已经初始化的组件不再初始化
  void init(BuildContext context) {
    if(_isFirst){
      _isFirst = false;
      doInit(context);
    }
  }

  ///获取数据
  @protected
  Future refresData(BuildContext context);

  ///保证初始化只初始化一次
  @protected
  void doInit(BuildContext context);

  void dispose();
}