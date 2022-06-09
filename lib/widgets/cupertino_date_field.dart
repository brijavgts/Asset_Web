//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:vee2care/core/res/colors.dart';
// import 'package:vee2care/core/res/images.dart';
// import 'package:vee2care/core/res/spacing.dart';
// import 'package:vee2care/core/res/styles.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vgts_plugin/form/utils/form_field_controller.dart';
//
// TextStyle _errorTextStyle = AppTextStyle.bodyText2.copyWith(color: AppColor.error, fontSize: 13, fontWeight: FontWeight.w500);
// TextStyle _labelTextStyle = AppTextStyle.bodyText1.copyWith(fontWeight: FontWeight.normal);
// TextStyle _bodyTextStyle = AppTextStyle.bodyText1;
// TextStyle _hintTextStyle = AppTextStyle.bodyText1.copyWith(color: const Color(0xffbdc1c6), fontWeight: FontWeight.normal);
//
// BorderRadius _borderRadius = BorderRadius.circular(10.0);
//
// class CupertinoDateField extends StatefulWidget {
//
//   DateFieldController controller;
//
//   String label;
//   TextStyle? textStyle;
//   TextAlign textAlign;
//
//   EdgeInsets? margin;
//   EdgeInsets? padding;
//
//   TextInputAction textInputAction;
//
//   String? placeholder;
//   Widget? suffixIcon;
//
//   String? counterText;
//
//   bool autoFocus = false;
//   bool isPasswordField = false;
//
//   bool enabled = true;
//
//   ValueChanged<String>? onChanged = (terms) {};
//   ValueChanged<String>? onSubmitted = (terms) {};
//
//   CupertinoDateField(this.label,
//       this.controller, {
//         this.margin = EdgeInsets.zero,
//         this.onSubmitted,
//         this.onChanged,
//         this.autoFocus = false,
//         this.enabled = true,
//         this.placeholder,
//         this.padding,
//         this.textAlign = TextAlign.right,
//         this.textStyle,
//         this.textInputAction = TextInputAction.next,
//         this.suffixIcon,
//         this.counterText
//       });
//
//   @override
//   _CupertinoDateFieldState createState() => _CupertinoDateFieldState();
// }
//
// class _CupertinoDateFieldState extends State<CupertinoDateField> {
//
//   bool isVisible = false;
//   bool isFocused = false;
//
//   @override
//   void initState() {
//
//     widget.controller.focusNode..addListener(() {
//      if( widget.controller.focusNode.hasFocus){
//        isFocused = true;
//      }
//      else{
//        isFocused = false;
//      }
//       setState(() {});
//     });
//
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       margin: widget.margin,
//       padding: const EdgeInsets.only(left: 15, right: 15),
//       color: Colors.white,
//       child: FormField<DateTime>(
//         initialValue: widget.controller.value,
//         validator: (value) {
//           if (!widget.controller.required && widget.controller.value == null) {
//             return null;
//           }
//
//           if ((widget.controller.required || widget.controller.value == null) && widget.controller.validator != null) {
//             return widget.controller.validator(value);
//           }
//
//           return null;
//         },
//         builder: (FormFieldState state) {
//           return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//                     Expanded(
//                       child: Text(
//                         widget.label,
//                         textScaleFactor: 1,
//                         style: _labelTextStyle,
//                       ),
//                     ),
//
//                     HorizontalSpacing.d10px(),
//
//                     Expanded(
//                       child: InkWell(
//                         onTap: (){
//                           showDatePicker(widget.controller.value!);
//                         },
//                         child: SizedBox(
//                           height: 44,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(widget.controller.formattedValue, textScaleFactor: 1, style: widget.textStyle ?? _bodyTextStyle)
//                           )
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//
//                 if (state.hasError)
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(state.errorText ?? '', textScaleFactor: 1, style: _errorTextStyle,)
//                   ),
//
//                 Divider(height: 5, color: state.hasError ? AppColor.error : null,)
//
//               ]
//           );
//         },
//       ),
//     );
//   }
//
//   void dispose() {
//     widget.controller.focusNode.removeListener(() { });
//     super.dispose();
//   }
//
//   showDatePicker(DateTime dateTime) async {
//     DateTime selectedDateTime = dateTime;
//
//     showCupertinoModalPopup(
//         context: context,
//         builder: (BuildContext buildContext) {
//           return Container(
//             height: MediaQuery.of(context).copyWith().size.height*0.3,
//             color: Colors.white,
//             child: Column(
//               children: [
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//
//                     CupertinoButton(onPressed: () {
//                       Navigator.pop(buildContext);
//                     },
//                     child: const Text("Cancel", textScaleFactor: 1),),
//
//                     CupertinoButton(onPressed: () {
//                         Navigator.pop(buildContext);
//                         setState(() {
//                           widget.controller.setValue(selectedDateTime);
//                         });
//                     },
//                     child: const Text("Select", textScaleFactor: 1,),)
//
//                   ],
//                 ),
//
//                 Flexible(
//                   child: CupertinoDatePicker(
//                     mode: CupertinoDatePickerMode.date,
//                     onDateTimeChanged: (value) {
//                       selectedDateTime = value;
//                     },
//                     initialDateTime: dateTime,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//     );
//   }
//
// }
//
//
//
// class DateFieldController {
//
//   Key fieldKey;
//   FocusNode focusNode = FocusNode();
//   DateTime? value;
//   bool required;
//
//   DateFieldController(this.fieldKey, { this.value, this.required = true });
//
//   String get formattedValue => value == null ? '' : DateFormat("dd MMM,yyyy").format(value!);
//
//   String? validator(DateTime? value) {
//     if (value == null && required)
//       return "Required !";
//
//     return null;
//   }
//
//   setValue(DateTime? value) {
//     this.value = value;
//   }
//
// }
//
