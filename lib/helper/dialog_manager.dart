
import 'package:asset_management/core/model/base_model.dart';
import 'package:asset_management/view/main/employee/employee_page.dart';
import 'package:asset_management/widgets/dropdown.dart';
import 'package:asset_management/widgets/edit_text_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../core/model/service/alert_request.dart';
import '../core/model/service/alert_response.dart';
import '../core/res/colors.dart';
import '../core/res/images.dart';
import '../core/res/spacing.dart';
import '../core/res/styles.dart';
import '../locator.dart';
import '../services/shared/dialog_service.dart';
import '../widgets/button.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

   DialogManager({ required this.child});

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final _dialogService = locator<DialogService>();



  var items =["Employee","Owner","Manager"];
  String dropDownvalue ="Employee";




  
  

  

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_dialogNewEmployee,_showInfoDialog, _showCustomAlertDialog, _showConfirmationDialog,_bottomSheet,);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: widget.child
        ),

        // if (locator<EnvironmentService>().environment != "PRODUCTION")
        //   DraggableFab(
        //     initPosition: const Offset(10, 20),
        //     child: FloatingActionButton(
        //       backgroundColor: AppColor.secondaryBackground,
        //       onPressed: () {
        //         _showLogModelBottomSheet();
        //       },
        //       child: const Icon(Icons.info,color: AppColor.error,),
        //     ),
        //   ),
      ],
    );
  }

  void _showInfoDialog(AlertRequest request) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: request.dismissable,
        builder: (context) {
          return WillPopScope(
              onWillPop: () async {
                _dialogService.dialogComplete(AlertResponse(status: false));
                return false;
              },
              child: CupertinoAlertDialog(
                title: Text(
                  request.title ?? '',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textOnPrimary,
                      letterSpacing: 0.5
                  ),
                ),
                content: Text(request.description ?? '', style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColor.textOnPrimary,
                    letterSpacing: 0.5
                )),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      request.buttonTitle  ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                          letterSpacing: 0.5
                      ),
                    ),
                    onPressed: () {
                      _dialogService.dialogComplete(AlertResponse(status: true));
                    },
                  ),
                ],
              ));
        });
  }



  //New Employee Dialog Box
  void _dialogNewEmployee(AlertRequest request) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: request.dismissable,
        builder: (context) {
        
          return WillPopScope(
              onWillPop: () async {
                _dialogService.dialogComplete(AlertResponse(status: false));
                return false;
              },
              child: StatefulBuilder(
                builder: (context,setState){
                 return AlertDialog(
                  scrollable: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColor.background),
                  padding: EdgeInsets.all(12),
                  width: 498,
                  height: 276,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: () {
                            _dialogService.dialogComplete(AlertResponse(status: true));
                          }, icon:  Icon(CupertinoIcons.clear_thick,size: 18),),
                          Text("Send Invite",style: AppTextStyle.body3.copyWith(fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Divider(height: 0.2,),

                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: 40,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                  placeholder: "email id",
                                  placeholderStyle: AppTextStyle.body3.copyWith(fontSize: 14,color: AppColor.nav),
                                  suffix: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        VerticalDivider(indent: 10,endIndent: 10,),
                                        SizedBox(width: 12,),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            icon: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 12),
                                              child: Icon(CupertinoIcons.chevron_down,size: 12),
                                            ),
                                              style: AppTextStyle.body3.copyWith(fontSize: 14),
                                            onChanged: (String? newValue){
                                                setState(() {
                                                  dropDownvalue = newValue!;
                                                });
                                            },
                                            value:dropDownvalue,
                                            items:items.map((String item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                child: Text(item),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           SizedBox(width: 12,),
                            Container(
                              height: 40,
                                width:  ResponsiveValue(context,defaultValue:106.0,valueWhen: [Condition.smallerThan(name: TABLET,value: 80.0),
                                ] ).value,
                                child: Button("Send Invite",textStyle: AppTextStyle.body3.copyWith(color: AppColor.white,
                                    fontSize:  ResponsiveValue(context,defaultValue:14.0,valueWhen: [Condition.smallerThan(name:TABLET,value: 12.0),
                                    ] ).value,),
                                    key: ValueKey("EmpButnKey"),
                                    onPressed: (){}))
                          ],
                        ),
                      ),

                      Divider(height: 0.2,),
                    ],
                  ),
                ),

                );
        }
              ));
        });
  }


  /*
  * ,*/

  
  
  // void _showLogModelBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
  //       builder: (context) =>  WillPopScope(
  //         onWillPop: () async {
  //           _dialogService.dialogComplete(AlertResponse(status: false));
  //           return false;
  //         },
  //         child: SafeArea(
  //           child: Container(
  //             height: MediaQuery.of(context).size.height - 20,
  //             child: ListView.separated(
  //                 itemCount: locator<LogService>().logHistory.length,
  //                 primary: false,
  //                 shrinkWrap: true,
  //                 separatorBuilder: (context, index){
  //                   return Divider();
  //                 },
  //                 itemBuilder: (context, index){
  //                   return Container(
  //                       padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //
  //                           Row(
  //                             children: [
  //
  //                               Expanded(child: Text(locator<LogService>().logHistory[index].type,  style: AppTextStyle.label2Medium.copyWith(color: locator<LogService>().logHistory[index].color),),),
  //
  //                               Text(locator<LogService>().logHistory[index].time, style: AppTextStyle.label3Medium,),
  //
  //                             ],
  //                           ),
  //
  //                           VerticalSpacing.d5px(),
  //
  //                           InkWell(
  //                               onTap: (){
  //                                 showCupertinoModalPopup(context: context, builder: (context) => Scaffold(
  //                                   appBar: AppBar(
  //                                     automaticallyImplyLeading: false,
  //                                     elevation: 0,
  //                                     actions: [
  //                                       IconButton(icon: Icon(Icons.close), onPressed: (){
  //                                         Navigator.pop(context);
  //                                       })
  //                                     ],
  //                                   ),
  //                                   body: SafeArea(
  //                                     child: ListView(
  //                                       padding: EdgeInsets.all(5),
  //                                       children: [
  //
  //                                         InkWell(
  //                                             onLongPress: (){
  //                                               Clipboard.setData(ClipboardData(text: locator<LogService>().logHistory[index].message));
  //                                               // Fluttertoast.showToast(
  //                                               //     msg: "Copied to Clipboard",
  //                                               //     toastLength: Toast.LENGTH_SHORT,
  //                                               //     gravity: ToastGravity.BOTTOM,
  //                                               //     timeInSecForIosWeb: 1,
  //                                               //     backgroundColor: Colors.black54,
  //                                               //     textColor: Colors.white,
  //                                               //     fontSize: 14.0
  //                                               // );
  //                                             },
  //                                             child: Text(locator<LogService>().logHistory[index].message)
  //                                         )
  //
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ));
  //
  //                               },
  //                               child: Text(locator<LogService>().logHistory[index].message,    maxLines: locator<LogService>().logHistory[index].expanded ? null : 3, style: AppTextStyle.label2Regular.copyWith(),)
  //                           )
  //
  //                         ],
  //                       )
  //                   );
  //                 }
  //             ),
  //           ),
  //         ),
  //       )
  //   );
  // }

  void _showConfirmationDialog(AlertRequest request) {

    showCupertinoDialog(context: context, builder:  (context) {
      return WillPopScope(
          onWillPop: () async {
            _dialogService.dialogComplete(AlertResponse(status: false));
            return false;
          },
          child: CupertinoAlertDialog(
            title: Text(
              request.title  ?? '',
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textOnPrimary,
                  letterSpacing: 0.5
              ),
            ),
            content: Text(request.description  ?? '', style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: AppColor.textOnPrimary,
                letterSpacing: 0.5
            )),
            actions: <Widget>[

              if (request.secondaryButtonTitle != null) CupertinoDialogAction(
                child: Text(
                  request.secondaryButtonTitle  ?? '',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: AppColor.primary,
                      letterSpacing: 0.5
                  ),
                ),
                onPressed: () {
                  _dialogService.dialogComplete(AlertResponse(status: false));
                },
              ),

              CupertinoDialogAction(
                child: Text(
                  request.buttonTitle  ?? '',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary,
                      letterSpacing: 0.5
                  ),
                ),
                onPressed: () {
                  _dialogService.dialogComplete(AlertResponse(status: true));
                },
              ),

            ],
          ));
    });

  }

  void _showCustomAlertDialog(AlertRequest request) {
    showDialog(context: context,
        builder: (context){
          return WillPopScope(
            onWillPop: (){
              return Future.value(false);
            },
            child: AlertDialog(
              contentPadding: const EdgeInsets.all(20),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24.0))),
              content: Container(
                height: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(Images.appLogo, width: 100, height: 100,),

                    VerticalSpacing.custom(value: 30),

                    Text(request.title  ?? '', textScaleFactor: 1, style: AppTextStyle.h5Heading,),

                    VerticalSpacing.d20px(),

                    Text(request.description  ?? '', textAlign: TextAlign.center, textScaleFactor: 1, style: AppTextStyle.h6Heading,),

                    VerticalSpacing.d20px(),

                    Button(request.buttonTitle ?? '', width: double.infinity, key: const Key('btnPrimary'), onPressed: (){
                      _dialogService.dialogComplete(AlertResponse(status: true));
                    }),

                    request.secondaryButtonTitle != null ? MaterialButton(onPressed: (){
                      _dialogService.dialogComplete(AlertResponse(status: false));
                    }, child: Text(request.secondaryButtonTitle ?? '', textScaleFactor: 1, style: AppTextStyle.buttonSmall.copyWith(color: AppColor.primary),)) : Container()

                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  void _bottomSheet(AlertRequest request) {

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        //barrierColor: AppColor.primary,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (context) => Container(
          padding: MediaQuery.of(context).viewInsets,
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.bottom > 0 ? MediaQuery.of(context).viewPadding.bottom : 25),
          decoration: const BoxDecoration(
            color: AppColor.background,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
          ),
          child: Wrap(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 4.0,
                  width: 24.0,
                  margin: const EdgeInsets.only(top: 8.0),
                  decoration: const BoxDecoration(
                    color: AppColor.textOnPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
              ),

              if (request.showActionBar == true)
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      if (request.iconWidget != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: request.iconWidget,
                        ),

                      Expanded(
                          child: request.title == null ? Container() : Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(request.title ?? '', textScaleFactor: 1,
                              style: AppTextStyle.h3Heading.copyWith(fontSize: 17,),
                            ),
                          )
                      ),

                      if(request.showCloseIcon == true)   IconButton(
                        onPressed: () {
                          _dialogService.dialogComplete(AlertResponse(status: false));
                        },
                        icon: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            Icons.close, size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              SingleChildScrollView(
                  child: Wrap(
                    children: [
                      SafeArea(child: request.contentWidget ?? Container()),
                    ],
                  )
              ),

            ],
          ),
        )
    );

  }

}