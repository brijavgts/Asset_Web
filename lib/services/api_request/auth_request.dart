
import '../shared/api_model/request_settings.dart';
import '../shared/request_method.dart';

class AuthRequest {

  //Register Request
  static RequestSettings register(String name,String emailId,String password,String organizationName){
    Map<String, dynamic> params = <String, dynamic>{};
    params['name'] = name;
    params['emailId'] = emailId;
    params['password'] = password;
    params['organizationName'] = organizationName;

    return RequestSettings(
        "/api/register",
        RequestMethod.POST,
        params:params,
        authenticated: false
    );
  }

  //Login Request
  static RequestSettings login(String emailId,String password ){
    Map<String, dynamic> params = <String, dynamic>{};
    params['emailId'] = emailId;
    params['password'] = password;
    return RequestSettings(
      "/api/login",
      RequestMethod.POST,
      authenticated: false,
      params: params
    );
  }


  //---------
  //verify Email
  static RequestSettings verifyEmail(String hashedEmail) {
    return RequestSettings(
        "/api/verify/$hashedEmail",
        RequestMethod.GET,
        params: null,
        authenticated: false
    );
  }
  //----------

  //Forgot Password Request
  static RequestSettings forgot_pwd(String emailId){
 Map<String, dynamic> params = <String, dynamic>{};
 params['emailId']=emailId;
    return RequestSettings(
        "/api/forget",
        RequestMethod.POST,
        authenticated: false,
        params:params,
    );
  }

  //Change Password Request
  static RequestSettings change_pwd(String password){
    Map<String, dynamic> params =<String, dynamic>{};
    return RequestSettings(
      "/api/reset",
      RequestMethod.POST,
      authenticated: false,
      params: params,
    );
  }



  static RequestSettings login1(String mobileNumber) {
    return RequestSettings(
        "/user/otp/$mobileNumber/",
        RequestMethod.GET,
        params: null,
        authenticated: false
    );
  }

  static RequestSettings verify (String mobileNumber,String otp,String token) {
    Map<String, dynamic> params = <String, dynamic>{};
    params['mobile'] = mobileNumber;
    params['otp'] = otp;
    params['device_id'] = token;

    return RequestSettings(
        "/user/parent-student-login/",
        RequestMethod.POST,
        params: params,
        authenticated: false
    );
  }

  static RequestSettings verifyRegister(String path) {
    return RequestSettings(
        path ,
        RequestMethod.GET,
        params: null,
        authenticated: true
    );
  }

  static RequestSettings homeApi(String path) {
    return RequestSettings(
        path ,
        RequestMethod.GET,
        params: null,
        authenticated: true
    );
  }

}