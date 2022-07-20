
import 'package:asset_management/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../vgts_base_view_model.dart';

class MainLayoutViewModel extends VGTSBaseViewModel {

  int _index = 0;


  int get index => _index;

  set index(int value) {
    _index = value;
  }

  List<Item> topBarItems = [
    Item(
      text: 'Assets', iconData:CupertinoIcons.cube_box,path: Routes.assets
    ),
    Item(
      text: 'Employees',iconData: Icons.group_outlined,path: Routes.employee
    ),
  ];

  List<Item> navBarItems = [
    Item(
        text: 'Menu', iconData:Icons.menu,path: Routes.assets
    ),
    Item(
        text: 'Assets', iconData:CupertinoIcons.cube_box,path: Routes.assets
    ),
    Item(
        text: 'Employees',iconData: Icons.group_outlined,path: Routes.employee
    ),
  ];

  ScrollController itemScrollController = ScrollController();

  TextFormFieldController textController=TextFormFieldController(ValueKey("text"),);

  void init(int data) {
    _index = data;
    notifyListeners();
  }

}


class Item {
  String? text;
  IconData? iconData;
  String? path;
  Item({this.text, this.iconData,this.path});
}
