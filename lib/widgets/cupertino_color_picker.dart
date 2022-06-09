//
// import 'package:flex_color_picker/flex_color_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vee2care/core/res/colors.dart';
// import 'package:vee2care/core/res/images.dart';
// import 'package:vee2care/core/res/spacing.dart';
// import 'package:vee2care/core/res/styles.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vee2care/helper/utils.dart';
// import 'package:vgts_plugin/form/utils/form_field_controller.dart';
// import 'package:vgts_plugin/form/utils/input_validator.dart';
//
// TextStyle _errorTextStyle = AppTextStyle.bodyText2.copyWith(color: AppColor.error, fontSize: 13, fontWeight: FontWeight.w500);
// TextStyle _labelTextStyle = AppTextStyle.bodyText1.copyWith(fontWeight: FontWeight.normal);
// TextStyle _bodyTextStyle = AppTextStyle.bodyText1;
// TextStyle _hintTextStyle = AppTextStyle.bodyText1.copyWith(color: const Color(0xffbdc1c6), fontWeight: FontWeight.normal);
//
// class CupertinoColorPicker extends StatefulWidget {
//
//   FormFieldController controller;
//
//   String label;
//   TextStyle? textStyle;
//   TextAlign textAlign;
//
//   EdgeInsets? margin;
//   EdgeInsets? padding;
//
//   String? placeholder;
//   Widget? prefixIcon;
//   Widget? suffixIcon;
//
//   bool autoFocus = false;
//   bool enabled = true;
//
//   ValueChanged<String>? onChanged = (terms) {};
//
//   CupertinoColorPicker(this.label,
//       this.controller, {
//         this.margin = EdgeInsets.zero,
//         this.onChanged,
//         this.autoFocus = false,
//         this.enabled = true,
//         this.placeholder,
//         this.prefixIcon,
//         this.padding,
//         this.textAlign = TextAlign.right,
//         this.textStyle,
//         this.suffixIcon,
//       });
//
//
//   @override
//   _CupertinoColorPickerState createState() => _CupertinoColorPickerState();
// }
//
// class _CupertinoColorPickerState extends State<CupertinoColorPicker> {
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
//       child: FormField<String>(
//         initialValue: widget.controller.text,
//         validator: (value) {
//           if (!widget.controller.required && widget.controller.text.isEmpty) {
//             return null;
//           }
//
//           if ((widget.controller.required || widget.controller.text.isNotEmpty) && widget.controller.validator != null) {
//             return widget.controller.validator!(value);
//           }
//
//           return null;
//         },
//         builder: (FormFieldState state) {
//
//           if (widget.controller.textEditingController.hasListeners) {
//             widget.controller.textEditingController.removeListener(() { });
//           }
//
//           widget.controller.textEditingController.addListener(() {
//             print(widget.controller.text);
//             state.reset();
//             state.didChange(widget.controller.text);
//           });
//
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
//                         onTap: () async {
//                           Color color = await colorPickerDialog(widget.controller.text);
//                           setState(() {
//                             widget.controller.text = color.value.toRadixString(16);
//                           });
//                           state.reset();
//                           state.didChange(widget.controller.text);
//                         },
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Container(
//                             height: 44,
//                             width: 44,
//                             padding: const EdgeInsets.all(5),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color(int.parse(widget.controller.text, radix: 16)),
//                                   borderRadius: BorderRadius.circular(5)
//                               ),
//                             ),
//                           ),
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
//   Future<Color> colorPickerDialog(String activeColor) async {
//     Color color = Color(int.parse(activeColor, radix: 16));
//     var selectedColor = Colors.white;
//     var status = await ColorPicker(
//       color: color,
//       onColorChanged: (Color color) {
//         selectedColor = color;
//       },
//       width: 40,
//       height: 40,
//       borderRadius: 12,
//       spacing: 5,
//       runSpacing: 5,
//       actionButtons: const ColorPickerActionButtons(
//         dialogOkButtonType: ColorPickerActionButtonType.elevated,
//         dialogCancelButtonType: ColorPickerActionButtonType.outlined,
//       ),
//       heading: Text(
//         'Select Color',
//         style: AppTextStyle.subtitle2,
//       ),
//       subheading: Text(
//         'Select Color Shade',
//         style: AppTextStyle.subtitle2,
//       ),
//       pickersEnabled: const <ColorPickerType, bool>{
//         ColorPickerType.both: false,
//         ColorPickerType.primary: true,
//         ColorPickerType.accent: false,
//         ColorPickerType.bw: false,
//         ColorPickerType.custom: false,
//         ColorPickerType.wheel: false,
//       },
//     ).showPickerDialog(
//       context,
//     );
//     return status ? selectedColor : color;
//   }
//
// }
//
// class ColorFormFieldController extends FormFieldController {
//
//   String? requiredText;
//
//   ColorFormFieldController(Key fieldKey, { required Color value, int maxLength = 10, bool required = true, this.requiredText }) : super(fieldKey, maxLength: maxLength, required: required) {
//    super.text = value.value.toRadixString(16);
//   }
//
//   @override
//   String? Function(String? p1)? get validator => !this.required ? null : (String? p1) => InputValidator.emptyValidator(p1, requiredText: requiredText);
//
//   Color get colorCode => getColorFromHex(text);
//
// }
