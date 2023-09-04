import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterCubit get(context) => BlocProvider.of(context);

  var formKey = new GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isOb = true;

  changePasswordVisibility(){
    isOb = !isOb;
    emit(RegisterChangePasswordVisibility());
  }

}
