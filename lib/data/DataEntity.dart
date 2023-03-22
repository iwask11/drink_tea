class TopBacket{
  String place;
  double distance;
  String sellText;

  TopBacket(this.place,this.distance,this.sellText);
}

class DrinkInfo{
  String pic;
  String name;
  String introduce;
  double price;
  int howMany;
  double allPrice;
  double discount;
  String howBig;
  String howIce;
  String howSweet;
  List WhatMixup;

  DrinkInfo(this.pic,this.name,this.introduce,this.price,this.howMany,
  this.allPrice,this.discount,this.howBig,this.howIce,this.howSweet,this.WhatMixup);
}

// class Order{
//   String pic;
//   String isOut;
//   String place;
//   String isOk;
//   String drinkName;
//   List basicHow;
//   double allPrice;
//   int howMany;
//   String finishTime;
//
//   Order(this.pic,this.isOut,this.place,this.isOk,this.drinkName,this.basicHow,
//       this.allPrice,this.howMany,this.finishTime);
// }
//
// class Recommend{
//   String pic;
//   String name;
//   List basicHow;
//
//   Recommend(this.pic,this.name,this.basicHow);
// }