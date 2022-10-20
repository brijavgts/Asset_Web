import 'package:flutter/cupertino.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../../core/enum/view_state.dart';
import '../../../../vgts_base_view_model.dart';


class EmpInviteViewModel extends VGTSBaseViewModel {

  List<String> suggestions=["Design","Administration"];
  List<String> suggest=[];
  String search ="";


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ScrollController regScrollController = ScrollController();

  NameFormFieldController nameController= NameFormFieldController(ValueKey("regName"),
      required: true,requiredText: "Please enter your Name");

  NameFormFieldController orgController=NameFormFieldController(ValueKey("regtOrg"),
      required: true,requiredText: "Please enter Organization Name"
  );

  EmailFormFieldController emailController = EmailFormFieldController(ValueKey("regEmail"),
      required: true,requiredText: "Please enter an Email"
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("regPwd"),
      required: true,requiredText: "Password field is required");


  inviteEmp(BuildContext context) async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }

    setState(ViewState.Busy);

    // RegisterAuth? auth = await request<RegisterAuth>(AuthRequest.register(nameController.text, emailController.text, passwordController.text,orgController.text));
    // if (auth != null) {
    //   Fluttertoast.showToast(msg: "Verifying Email.....");
    //   context.go(Routes.verification,);
    // }
    setState(ViewState.Idle);

    notifyListeners();
  }

}