import 'package:drink_tea/model/MenuItem.dart';
import 'package:flutter/material.dart';


///标签模块样式
class MenuTagWrap extends StatelessWidget {
  const MenuTagWrap({Key? key, required this.chose}) : super(key: key);

  final Map<String, List<MenuItem>> chose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(chose.length, (index) => Container(
        // color: Colors.blueAccent,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(chose.keys.toList()[index].toString(),
                    style: TextStyle(fontSize: 18))
            ),
            Wrap(
              spacing: 10,runSpacing: 10,
                children: _choseWrap(chose, chose.keys.toList()[index].toString())
            )
          ],
        ),
      )),
    );
  }
}

_choseWrap(chose, title){
  if(chose == null) {
    print("选项为空！！！！请填充！！！");
    return [Container()];
  }else {
    return List.generate(
        chose[title].length, (j) => GestureDetector(
            onTap: () => {},
            child: Container(
              margin: EdgeInsets.only(right: 5),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: Text(chose[title][j].title,
                  style: TextStyle(fontSize: 14)),
            ),
          )
    );
  }
}