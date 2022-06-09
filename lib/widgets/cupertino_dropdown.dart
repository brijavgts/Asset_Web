// import 'package:flutter/material.dart';
// import 'package:vee2care/core/model/base_model.dart';
// import 'package:vee2care/core/res/colors.dart';
// import 'package:vee2care/core/res/spacing.dart';
// import 'package:vee2care/core/res/styles.dart';
// import 'package:vgts_plugin/form/utils/form_field_controller.dart';
//
// Color _focusBgColor = AppColor.primary;
// Color _errorBgColor = const Color(0xffFFF5F5);
// Color _errorColor = const Color(0xffEB1414);
//
// TextStyle _errorTextStyle = AppTextStyle.bodyText2.copyWith(color: AppColor.error, fontSize: 13, fontWeight: FontWeight.w500);
// TextStyle _labelTextStyle = AppTextStyle.bodyText1.copyWith(fontWeight: FontWeight.normal);
// TextStyle _bodyTextStyle = AppTextStyle.bodyText1;
// TextStyle _hintTextStyle = AppTextStyle.bodyText1.copyWith(color: const Color(0xffbdc1c6), fontSize: 15, fontWeight: FontWeight.normal);
//
// BorderRadius _borderRadius = BorderRadius.circular(6.0);
//
// class CupertinoDropdownField<T extends BaseModel> extends StatefulWidget {
//
//   DropdownFieldController<T> controller;
//
//   String title;
//   String placeholder;
//   EdgeInsets margin;
//   EdgeInsets? padding;
//   Function(T)? onChange;
//   Function? onAddNewPressed;
//   bool withAdd = false;
//   bool showRequiredHint = true;
//
//   CupertinoDropdownField(this.title, this.controller, {
//     this.placeholder = "",
//     this.margin = EdgeInsets.zero,
//     this.padding,
//     this.showRequiredHint = true,
//     this.onChange
//   });
//
//   CupertinoDropdownField.withAdd(this.title, this.controller, {
//     this.placeholder = "",
//     this.margin = EdgeInsets.zero,
//     this.onChange,
//     this.padding,
//     this.showRequiredHint = true,
//     this.onAddNewPressed
//   }) {
//     this.withAdd = true;
//   }
//
//   @override
//   _CupertinoDropdownFieldState<T> createState() => _CupertinoDropdownFieldState<T>();
// }
//
// class _CupertinoDropdownFieldState<T extends BaseModel> extends State<CupertinoDropdownField<T>> {
//
//   BorderRadius borderRadius = BorderRadius.circular(5);
//
//   List<DropdownMenuItem<T>> get dropdownMenuItemWidget {
//     return widget.controller.list.map<DropdownMenuItem<T>>((T value) {
//       Map data = value.toJson();
//       return DropdownMenuItem<T>(
//         value: value,
//         child: Text(data[widget.controller.valueId] ?? '', style: _bodyTextStyle,),
//       );
//     }).toList();
//   }
//
//   T? emptyObject;
//
//   @override
//   void initState() {
//     if (widget.withAdd) {
//       Map<String, dynamic> map = new Map();
//       map[widget.controller.keyId] = -1;
//       map[widget.controller.valueId] = "Create New";
//       BaseModel.createFromMap<T>(map).then((value) {
//         setState(() {
//           emptyObject = value;
//         });
//       });
//     }
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: widget.margin,
//       padding: const EdgeInsets.only(left: 15,),
//       color: Colors.white,
//       child: FormField<T>(
//           initialValue: widget.controller.value,
//           validator: (value) {
//             return widget.controller.validator(value);
//           },
//           builder: (FormFieldState state) {
//
//             return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//
//                       Expanded(
//                         child: Text(
//                           widget.title,
//                           textScaleFactor: 1,
//                           style: _labelTextStyle,
//                         ),
//                       ),
//
//                       HorizontalSpacing.d10px(),
//
//                       SizedBox(
//                         height: 44,
//                         child: Container(
//                           padding: widget.padding ?? const EdgeInsets.symmetric(vertical:12, horizontal: 16),
//                           child: DropdownButton<T>(
//                             key: widget.controller.fieldKey,
//                             value: widget.controller.value,
//                             icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.textOnSurface,),
//                             iconSize: 24,
//                             // elevation: 16,
//                             itemHeight: 48,
//                             hint: Text(widget.placeholder, style: _hintTextStyle, ),
//                             style: _bodyTextStyle,
//                             isExpanded: false,
//                             focusNode: widget.controller.focusNode,
//                             underline: Container(),
//                             alignment: Alignment.centerRight,
//                             selectedItemBuilder: (context) {
//                               if (widget.controller.value == null) return [
//                                 Container()
//                               ];
//
//                               Map? data = widget.controller.value?.toJson();
//
//                               if (data?[widget.controller.keyId] == -1) {
//                                 return [
//                                   Container()
//                                 ];
//                               }
//                               return List<Widget>.from(dropdownMenuItemWidget);
//                             },
//                             onChanged: (T? value) {
//                               if (value == null) return;
//
//                               if (value.toJson()[widget.controller.keyId] == -1) {
//                                 setState(() {
//                                   widget.controller.setValue(null);
//                                 });
//                                 return;
//                               }
//
//                               setState(() {
//                                 widget.controller.setValue(value);
//                               });
//
//                               state.reset();
//                               state.didChange(value);
//
//                               if (widget.onChange!= null) {
//                                 widget.onChange!(value);
//                               }
//                             },
//                             items: [
//                               ...dropdownMenuItemWidget,
//
//                               if (widget.withAdd && emptyObject != null)
//                                 DropdownMenuItem<T>(
//                                     value: emptyObject,
//                                     onTap: (){
//                                       if (widget.onAddNewPressed != null)
//                                         widget.onAddNewPressed!();
//                                     },
//                                     child: Row(
//                                       children: [
//
//                                         Container(
//                                           width: 24,
//                                           height: 24,
//                                           decoration: BoxDecoration(
//                                               color: AppColor.secondary,
//                                               borderRadius: BorderRadius.circular(5)
//                                           ),
//                                           child: const Center(child: Icon(Icons.add, color: Colors.white, size: 18,)),
//                                         ),
//
//                                         const Padding(
//                                           padding: const EdgeInsets.only(left: 10),
//                                         ),
//
//                                         const Expanded(child: Text("Create New",)),
//                                       ],
//                                     )
//                                 )
//
//                             ],
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//
//                   if (state.hasError)
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(state.errorText ?? '', textScaleFactor: 1, style: _errorTextStyle,)
//                     ),
//
//                   Divider(height: 5, color: state.hasError ? AppColor.error : null,)
//
//                 ]
//             );
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Padding(
//                   padding:const EdgeInsets.only(left: 4.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.title,
//                           style: _labelTextStyle,
//                         ),
//                       ),
//
//                       if (state.hasError && widget.showRequiredHint)
//                         Text(
//                           state.errorText ?? '',
//                           style: _errorTextStyle,
//                         ),
//
//                     ],
//                   ),
//                 ),
//
//                 const Padding(
//                   padding: EdgeInsets.only(top:4),
//                 ),
//
//                 SizedBox(
//                   height: 46,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: state.hasError ? _errorBgColor : _focusBgColor,
//                         border: _outlineInputBorder(state.hasError),
//                         borderRadius: _borderRadius,
//                     ),
//                     padding: widget.padding ?? const EdgeInsets.symmetric(vertical:12, horizontal: 16),
//                     child: DropdownButton<T>(
//                       key: widget.controller.fieldKey,
//                       value: widget.controller.value,
//                       icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.textOnSurface,),
//                       iconSize: 24,
//                       // elevation: 16,
//                       itemHeight: 48,
//                       hint: Text(widget.placeholder,    style: _hintTextStyle,),
//                       style: _bodyTextStyle,
//                       isExpanded: true,
//                       focusNode: widget.controller.focusNode,
//                       underline: Container(),
//                       selectedItemBuilder: (context) {
//                         if (widget.controller.value == null) return [
//                           Container()
//                         ];
//
//                         Map? data = widget.controller.value?.toJson();
//
//                         if (data?[widget.controller.keyId] == -1) {
//                           return [
//                             Container()
//                           ];
//                         }
//
//                         return List<Widget>.from(dropdownMenuItemWidget);
//                       },
//                       onChanged: (T? value) {
//
//                         print("ON CHANGED");
//
//                         if (value == null) return;
//
//                         if (value.toJson()[widget.controller.keyId] == -1) {
//                           setState(() {
//                             widget.controller.setValue(null);
//                           });
//                           return;
//                         }
//
//                         setState(() {
//                           widget.controller.setValue(value);
//                         });
//
//                         state.reset();
//                         state.didChange(value);
//
//                         if (widget.onChange!= null) {
//                           widget.onChange!(value);
//                         }
//                       },
//                       items: [
//                         ...dropdownMenuItemWidget,
//
//                         if (widget.withAdd && emptyObject != null)
//                           DropdownMenuItem<T>(
//                               value: emptyObject,
//                               onTap: (){
//                                 if (widget.onAddNewPressed != null)
//                                   widget.onAddNewPressed!();
//                               },
//                               child: Row(
//                                 children: [
//
//                                   Container(
//                                     width: 24,
//                                     height: 24,
//                                     decoration: BoxDecoration(
//                                         color: AppColor.secondary,
//                                         borderRadius: BorderRadius.circular(5)
//                                     ),
//                                     child: const Center(child: Icon(Icons.add, color: Colors.white, size: 18,)),
//                                   ),
//
//                                   const Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                   ),
//
//                                   const Expanded(child: Text("Create New",)),
//                                 ],
//                               )
//                           )
//
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ],
//             );
//           }
//       ),
//     );
//   }
//
//   Border _outlineInputBorder(bool hasError) => Border.all(
//       color: hasError ? _errorColor : AppColor.outline,
//       width: 1
//   );
//
// }
//
//
