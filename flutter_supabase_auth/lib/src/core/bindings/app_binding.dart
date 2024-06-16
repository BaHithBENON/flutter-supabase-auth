import 'package:authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:authentication/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:authentication/data/repositories/auth_repository_impl.dart';
import 'package:authentication/domain/repositories/auth_repository.dart';
import 'package:authentication/domain/usecases/user_get_otp_email_usecase.dart';
import 'package:authentication/domain/usecases/user_login_email_password_usecase.dart';
import 'package:authentication/domain/usecases/user_logout_usecase.dart';
import 'package:authentication/domain/usecases/user_register_email_password_usecase.dart';
import 'package:authentication/domain/usecases/user_resend_otp_usecase.dart';
import 'package:authentication/domain/usecases/verify_user_auth_by_otp_usecase.dart';

import 'package:get/get.dart';
import '../../features/authentication/controllers/auth_controller.dart';

part 'app_binding.main.dart';
