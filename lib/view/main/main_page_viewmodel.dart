
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../vgts_base_view_model.dart';
import 'main_page.dart';

class MainPageViewModel extends VGTSBaseViewModel {

  int _index = 0;


  int get index => _index;

  set index(int value) {
    _index = value;
  }

  List<Item> navBarItems = [
    Item(
      text: 'Analytics', iconData: CupertinoIcons.waveform_path_ecg,path: "/analytics"
    ),
    Item(
      text: 'Assets', iconData:CupertinoIcons.cube_box,path: "/assets"
    ),
    Item(
      text: 'Employees',iconData: Icons.group_outlined,path: "/employees"
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
