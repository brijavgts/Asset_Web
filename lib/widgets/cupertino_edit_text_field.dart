//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
// enum CupertinoEditTextFieldStyle { VERTICAL, HORIZONTAL }
//
// class CupertinoEditTextField extends StatefulWidget {
//
//   FormFieldController controller;
//
//   String label;
//   TextStyle? textStyle;
//   TextAlign textAlign;
//
//   EdgeInsets? margin;
//   EdgeInsets? padding;
//   EdgeInsets? contentPadding;
//
//   TextInputAction textInputAction;
//
//   String? placeholder;
//   Widget? suffixIcon;
//
//   String? counterText;
//
//   double? height;
//
//   bool autoFocus = false;
//   bool isPasswordField = false;
//
//   bool enabled = true;
//
//   CupertinoEditTextFieldStyle textFieldStyle;
//   Function? onTap;
//   ValueChanged<String>? onChanged = (terms) {};
//   ValueChanged<String>? onSubmitted = (terms) {};
//
//   CupertinoEditTextField(this.label,
//       this.controller, {
//         this.margin = EdgeInsets.zero,
//         this.onSubmitted,
//         this.onChanged,
//         this.autoFocus = false,
//         this.enabled = true,
//         this.placeholder,
//         this.padding,
//         this.contentPadding,
//         this.textAlign = TextAlign.right,
//         this.height,
//         this.textStyle,
//         this.textFieldStyle = CupertinoEditTextFieldStyle.HORIZONTAL,
//         this.textInputAction = TextInputAction.next,
//         this.suffixIcon,
//         this.counterText,
//         this.onTap
//       });
//
//
//   CupertinoEditTextField.password(this.label,
//       this.controller,
//       { this.margin = EdgeInsets.zero,
//         this.onSubmitted,
//         this.onChanged,
//         this.enabled = true,
//         this.autoFocus = false,
//         this.placeholder,
//         this.padding,
//         this.contentPadding,
//         this.height,
//         this.textAlign = TextAlign.right,
//         this.textFieldStyle = CupertinoEditTextFieldStyle.HORIZONTAL,
//         this.textInputAction = TextInputAction.next,
//         this.suffixIcon }) {
//     isPasswordField = true;
//   }
//
//
//
//   @override
//   _CupertinoEditTextFieldState createState() => _CupertinoEditTextFieldState();
// }
//
// class _CupertinoEditTextFieldState extends State<CupertinoEditTextField> {
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
//       padding: widget.padding ?? const EdgeInsets.only(left: 15, right: 15),
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
//             state.reset();
//             state.didChange(widget.controller.text);
//           });
//
//           return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//
//                 StyleWrapper(
//                   children: [
//                     if(widget.label.isNotEmpty)StyleExpanded(
//                       child: Text(
//                         widget.label,
//                         textScaleFactor: 1,
//                         style: _labelTextStyle,
//                       ),
//                     ),
//
//
//                     StyleExpanded(
//                       child: SizedBox(
//                         height: widget.height ?? 44,
//                         child: TextField(
//                             key: widget.controller.fieldKey,
//                             controller: widget.controller.textEditingController,
//                             enableInteractiveSelection: true,
//                             obscureText: widget.isPasswordField && !isVisible ? true : false,
//                             textInputAction: widget.textInputAction,
//                             textAlign: widget.textAlign,
//                             style: widget.textStyle ?? _bodyTextStyle,
//                             focusNode: widget.controller.focusNode,
//                             autofocus: widget.autoFocus,
//                             cursorColor: AppColor.primary,
//                             cursorWidth: 1.5,
//                             onTap:(){
//                               if (widget.onTap != null) {
//                                 widget.onTap!();
//                               }
//                             },
//                             onChanged: (value) {
//                               state.reset();
//                               state.didChange(value);
//                               if (widget.onChanged != null) {
//                                 widget.onChanged!(value);
//                               }
//                             },
//                             onSubmitted: (value) {
//                               if (widget.onSubmitted != null) {
//                                 widget.onSubmitted!(value);
//                               }
//                             },
//                             enabled: widget.enabled,
//                             maxLength: widget.controller.maxLength,
//                             maxLines: widget.isPasswordField ? 1 : widget.controller.maxLines,
//                             minLines: widget.controller.minLines,
//
//                             inputFormatters: widget.isPasswordField || widget.controller.textInputType == TextInputType.emailAddress ? [
//                               FilteringTextInputFormatter.deny(RegExp('[\\ ]')),
//                             ] : widget.controller.inputFormatter,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: widget.contentPadding,
//                               counterText: widget.counterText ?? "",
//                               hintText: widget.placeholder ?? '',
//                               hintStyle: widget.textStyle == null ? _hintTextStyle : widget.textStyle!.copyWith(color: const Color(0xffbdc1c6), fontWeight: FontWeight.normal),
//                               suffixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 20),
//                               prefixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 20),
//                               suffixIcon: widget.isPasswordField ? _buildPasswordEyeIcon() : widget.suffixIcon,
//                             ),
//
//                             // InputDecoration(
//                             //   fillColor: !widget.enabled ? AppColor.surface : isFocused ? AppColor.textOnError : const Color(0x41f5f5f5),
//                             //   filled: true,
//                             //   contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                             //   border: _outlineInputBorder,
//                             //   enabledBorder: _outlineInputBorder,
//                             //   disabledBorder: _outlineInputBorder,
//                             //   focusedBorder: _focusedInputBorder,
//                             //   errorBorder: _errorInputBorder,
//                             //   errorStyle: _errorTextStyle,
//                             //   errorText: state.hasError ? state.errorText : null,
//                             //   hintText: widget.placeholder,
//                             //   hintStyle: _hintTextStyle,
//                             //   focusColor: AppColor.surface,
//                             //   suffixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 20),
//                             //   prefixIconConstraints: const BoxConstraints(minWidth: 15, maxHeight: 20),
//                             //   prefix: widget.prefixText == null ? null : Text("${widget.prefixText} ", style: _bodyTextStyle,),
//                             //   prefixIcon: widget.prefixIcon ?? null,
//                             //   suffixIcon: widget.isPasswordField ? _buildPasswordEyeIcon() : widget.suffixIcon ?? null,
//                             //   counterText: widget.counterText ?? "",
//                             // ),
//                             keyboardType: widget.controller.textInputType,
//                             textCapitalization: widget.controller.textCapitalization
//                         ),
//                       ),
//                     ),
//                   ]
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
//   Widget _buildPasswordEyeIcon(){
//     return IconButton(
//       padding: EdgeInsets.zero,
//         icon: SvgPicture.asset(
//           isVisible ? Images.passShow : Images.passHidden, height: 18, width: 18,
//         ),
//         onPressed: () {
//           isVisible = !isVisible;
//           setState(() {});
//         }
//     );
//   }
//
//   Widget StyleWrapper({ required List<Widget> children }) {
//     if (widget.textFieldStyle == CupertinoEditTextFieldStyle.HORIZONTAL) {
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ...children
//         ],
//       );
//     } else {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...children
//         ],
//       );
//     }
//   }
//
//   Widget StyleExpanded( { required Widget child }) {
//     if (widget.textFieldStyle == CupertinoEditTextFieldStyle.HORIZONTAL) {
//       return Expanded(
//         child: child,
//       );
//     }
//     return child;
//   }
//
//   void dispose() {
//     widget.controller.focusNode.removeListener(() { });
//     super.dispose();
//   }
//
// }
//
