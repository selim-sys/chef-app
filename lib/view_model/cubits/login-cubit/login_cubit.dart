import 'package:bloc/bloc.dart';
import 'package:chefapp/view_model/network/dio_helper.dart';
import 'package:chefapp/view_model/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit get(context) => BlocProvider.of(context);

  var formKey = new GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isOb = true;

  changePasswordVisibility(){
    isOb = !isOb;
    emit(LoginChangePasswordVisibility());
  }

  void login({
    required String email,
    required String password
  })async{
    emit(LoginLoading());
    var data = {
      'email' : email,
      'password' : password
    };
    await DioHelper.postData(endPoint: EndPoints.loginEndpoint,
        data: data)
        .then((value) {
          debugPrint(value.data.toString());
          var userAccessToken = value.data['token'].toString();
          debugPrint('Token ----> $userAccessToken');
          debugPrint('SUCCESS');
          emit(LoginSuccess());
    }).catchError((e){
      debugPrint(onError.toString());
      debugPrint('FAIL');
      emit(LoginFailure(e));
    });

}

}
