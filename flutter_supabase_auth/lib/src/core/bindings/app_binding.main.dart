part of 'app_binding.dart';


/// AppBinding class is a class that implements the Bindings interface.
/// This class is responsible for defining the dependencies of the application.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    /*
      * Auth Controller
    */

    // Lazy put the AuthRemoteDataSource to the Get instance
    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(Get.find(),));

    // Lazy put the AuthRepository to the Get instance
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find(),));

    // Lazy put the UserResendOtpUseCase to the Get instance
    Get.lazyPut<UserResendOtpUseCase>(() => UserResendOtpUseCase(authRepository: Get.find(),));

    // Lazy put the UserLogoutUseCase to the Get instance
    Get.lazyPut<UserLogoutUseCase>(() => UserLogoutUseCase(authRepository: Get.find(),));

    // Lazy put the UserGetOtpEmailUseCase to the Get instance
    Get.lazyPut<UserGetOtpEmailUseCase>(() => UserGetOtpEmailUseCase(authRepository: Get.find(),));

    // Lazy put the VerifyUserAuthByOtpUseCase to the Get instance
    Get.lazyPut<VerifyUserAuthByOtpUseCase>(() => VerifyUserAuthByOtpUseCase(authRepository: Get.find(),));

    // Lazy put the UserLoginEmailPasswordUseCase to the Get instance
    Get.lazyPut<UserLoginEmailPasswordUseCase>(() => UserLoginEmailPasswordUseCase(authRepository: Get.find(),));

    // Lazy put the UserRegisterEmailPasswordUseCase to the Get instance
    Get.lazyPut<UserRegisterEmailPasswordUseCase>(() => UserRegisterEmailPasswordUseCase(authRepository: Get.find(),));

    // Put the AuthController to the Get instance
    Get.put(AuthController(
      userGetOtpEmailUseCase: Get.find<UserGetOtpEmailUseCase>(), 
      userRegisterEmailPasswordUseCase: Get.find<UserRegisterEmailPasswordUseCase>(),
      verifyUserAuthByOtpUseCase: Get.find<VerifyUserAuthByOtpUseCase>(),
      userResendOtpUseCase: Get.find<UserResendOtpUseCase>(),
      userLogoutUseCase: Get.find<UserLogoutUseCase>(),
      userLoginEmailPasswordUseCase: Get.find<UserLoginEmailPasswordUseCase>(),
    ));
  }  
}
