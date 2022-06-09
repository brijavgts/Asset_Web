
import '../shared/api_model/request_settings.dart';
import '../shared/request_method.dart';

class AuthRequest {

  static RequestSettings login(String mobileNumber) {
    return RequestSettings(
        "/user/otp/${mobileNumber}/",
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


  static RequestSettings homeApi(String path) {
    return RequestSettings(
        path ,
        RequestMethod.GET,
        params: null,
        authenticated: true
    );
  }

}