import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/routes.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  /// Get configs
  Future<void> getConfigs() async {
    Get.offAllNamed(AppRoute.mainScreen);
  }
}
