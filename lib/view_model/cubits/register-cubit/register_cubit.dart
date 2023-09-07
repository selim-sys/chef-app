import 'package:chefapp/view_model/network/dio_helper.dart';
import 'package:chefapp/view_model/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterCubit get(context) => BlocProvider.of(context);

  var formKey = new GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var cPasswordController = TextEditingController();

  bool isOb = true;

  changePasswordVisibility() {
    isOb = !isOb;
    emit(RegisterChangePasswordVisibility());
  }

  void register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
  }) async {
    emit(RegisterLoading());
    var data = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'location': location,
      'brandName': brandName,
      'minCharge': minCharge,
      'disc': disc
    };
    await DioHelper.postData(endPoint: EndPoints.registerEndpoint,
        data: data)
        .then((value) {
      debugPrint(value.data.toString());
      var userAccessToken = value.data['token'].toString();
      debugPrint('Token ----> $userAccessToken');
      debugPrint('SUCCESS');
      emit(RegisterSuccess());
    }).catchError((e){
      debugPrint(onError.toString());
      debugPrint('FAIL');
      emit(RegisterFailure(e));
    });
  }
}
