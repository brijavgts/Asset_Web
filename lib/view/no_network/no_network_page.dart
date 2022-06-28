//import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import '../../core/res/colors.dart';
import '../../core/res/images.dart';
import '../../locator.dart';
import 'no_network_viewmodel.dart';

class NoNetWorkPage extends ViewModelBuilderWidget<NoNetworkViewModel> {
  @override
  void onViewModelReady(NoNetworkViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  void checkState(BuildContext context) async {
    //if (result == ConnectivityResult.none) {
    //  Fluttertoast.showToast(
    //msg:"No Network Connection",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity:ToastGravity.BOTTOM,
    // );
    //}
    //else {
    // Navigator.pop(context);
    //}
    //});
  }

  @override
  NoNetworkViewModel viewModelBuilder(BuildContext context) =>
      NoNetworkViewModel();

  @override
  Widget builder(BuildContext context, NoNetworkViewModel viewModel,
      Widget? child) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Image.asset(Images.no_connection, width: 125, height: 125,),

                Padding(padding: EdgeInsets.all(15)),

                Text("No Network Connection",
                  style: TextStyle(fontSize: 20, letterSpacing: 0.8),),

                Padding(padding: EdgeInsets.all(25)),

                new SizedBox.fromSize(
                  child: new RaisedButton(
                      color: AppColor.primary,
                      child: Text("Retry",
                        style: TextStyle(fontSize: 15, color: AppColor.white),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: () {
                        checkState(context);
                      }
                  ),
                  size: Size(150, 40),
                ),

              ],
            ),
          ),
        )
    );
  }
}