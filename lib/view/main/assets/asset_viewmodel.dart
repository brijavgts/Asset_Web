import 'package:flutter/cupertino.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../vgts_base_view_model.dart';

class AssetViewModel extends VGTSBaseViewModel {

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
  }

  TextFormFieldController searchController= TextFormFieldController(ValueKey("searchPwd"),);

  int get catLength => cat.length + 1;

  List<Item> cat = [
    Item(image: "https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg", name: "Gadgets",subcat: 10,item: 2 ),
    Item(image: "https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg", name: "Gadgets",subcat: 10,item: 2 ),
    Item(image: "https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg", name: "Gadgets",subcat: 10,item: 2 ),
    Item(image: "https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg", name: "Gadgets",subcat: 10,item: 2 ),
    Item(image: "https://cdn.idropnews.com/wp-content/uploads/2017/07/26133500/MacBook-Pro-Giveaway1.jpg", name: "Gadgets",subcat: 10,item: 2 ),
  ];

}


class Item {
  String? image;
  String? name;
  int? subcat;
  int? item;
  Item({this.image,this.name,this.subcat,this.item});
}
