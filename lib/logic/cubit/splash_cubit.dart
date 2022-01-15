import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState{}

class SplashLoaded extends SplashState{}


class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()){
    displayImage();
  }



  displayImage(){
    emit(SplashLoading());
    Timer(const Duration(seconds: 5), () {
      emit(SplashLoaded());
});
  }
}
