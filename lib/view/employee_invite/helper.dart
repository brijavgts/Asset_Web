// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:substring_highlight/substring_highlight.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = false;
//
//   late List<String> autoCompleteData;
//
//   late TextEditingController controller;
//
//   Future fetchAutoCompleteData() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     final String stringData = await rootBundle.loadString("assets/data.json");
//
//     final List<dynamic> json = jsonDecode(stringData);
//
//     final List<String> jsonStringData = json.cast<String>();
//
//     setState(() {
//       isLoading = false;
//       autoCompleteData = jsonStringData;
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchAutoCompleteData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Auto complete"),
//       ),
//       body: isLoading
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Autocomplete(
//               optionsBuilder: (TextEditingValue textEditingValue) {
//                 if (textEditingValue.text.isEmpty) {
//                   return const Iterable<String>.empty();
//                 } else {
//                   return autoCompleteData.where((word) => word
//                       .toLowerCase()
//                       .contains(textEditingValue.text.toLowerCase()));
//                 }
//               },
//               optionsViewBuilder:
//                   (context, Function(String) onSelected, options) {
//                 return Material(
//                   elevation: 4,
//                   child: ListView.separated(
//                     padding: EdgeInsets.zero,
//                     itemBuilder: (context, index) {
//                       final option = options.elementAt(index);
//
//                       return ListTile(
//                         // title: Text(option.toString()),
//                         title: SubstringHighlight(
//                           text: option.toString(),
//                           term: controller.text,
//                           textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
//                         ),
//                         subtitle: Text("This is subtitle"),
//                         onTap: () {
//                           onSelected(option.toString());
//                         },
//                       );
//                     },
//                     separatorBuilder: (context, index) => Divider(),
//                     itemCount: options.length,
//                   ),
//                 );
//               },
//               onSelected: (selectedString) {
//                 print(selectedString);
//               },
//               fieldViewBuilder:
//                   (context, controller, focusNode, onEditingComplete) {
//                 this.controller = controller;
//
//                 return TextField(
//                   controller: controller,
//                   focusNode: focusNode,
//                   onEditingComplete: onEditingComplete,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey[300]!),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey[300]!),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Colors.grey[300]!),
//                     ),
//                     hintText: "Search Something",
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:asset_management/widgets/edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../core/res/colors.dart';
import '../../core/res/styles.dart';

TextEditingController controller =TextEditingController();

List<String> suggestions=["Design","Administration","Project Management","Human Resource"];
Widget Complete(){
  return Autocomplete(
    optionsBuilder: (TextEditingValue value) {
      if (value.text.isEmpty) {
        return const Iterable<String>.empty();
      } else {
        return suggestions.where((word) => word
            .toLowerCase()
            .contains(value.text.toLowerCase()));
      }
    },
    optionsViewBuilder:
        (context, Function(String) onSelected, options) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          child: Container(
            width: 438,
            height: 100.0 ,
            margin: EdgeInsets.only(top:4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.2),
            color: AppColor.white,
            ),
            child: ListView.builder(
               shrinkWrap: false,
              // padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);

                return ListTile(
                  title: Text(option.toString(),style: AppTextStyle.body5,),
                  // title: SubstringHighlight(
                  //   text: option.toString(),
                  //   term: orgController.text,
                  //   textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
                  // ),
                  onTap: () {
                    onSelected(option.toString());
                  },
                );
              },
              itemCount: options.length,
            ),
          ),
        ),
      );
    },
    onSelected: (selectedString) {
      print(selectedString);
    },
    fieldViewBuilder:
        (context, controller, focusNode, onEditingComplete) {

      return SizedBox(
        width: 438,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Department",style: AppTextStyle.label.copyWith(fontSize: 12),),
            SizedBox(height: 6,),
            SizedBox(
              height: 40,
              child: TextField(
                style: AppTextStyle.body5,
                controller:controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:  BorderSide(color: AppColor.black, width:1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColor.primary,width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: AppColor.error),
                  ),
                  hintText: "Eg: Design",
                  hintStyle:  AppTextStyle.body2.copyWith(color: AppColor.hint, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

