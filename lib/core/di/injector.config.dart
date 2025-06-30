// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../../src/admin/notifications/data/data_sources/notifications_datasource.dart'
    as _i12;
import '../../src/admin/notifications/data/repositories/notifications_repo.dart'
    as _i13;
import '../../src/admin/notifications/presentation/cubit/notification_cubit.dart'
    as _i36;
import '../../src/admin/payment/presentation/otp_message/cubit/otp_message_cubit.dart'
    as _i37;
import '../../src/admin/payment_subscribtion/cubit/payment_cubit.dart' as _i38;
import '../../src/admin/profile/data/data_sources/profile_datasource.dart'
    as _i14;
import '../../src/admin/profile/data/repositories/profile_repo.dart' as _i15;
import '../../src/admin/profile/presentation/profile/cubit/profile_cubit.dart'
    as _i39;
import '../../src/admin/profile/presentation/profile/cubit/profile_service_provider_cubit.dart'
    as _i40;
import '../../src/admin/service/data/data_sources/service_datasource.dart'
    as _i16;
import '../../src/admin/service/data/repositories/service_repo.dart' as _i17;
import '../../src/admin/service/presentation/cubit/service_cubit.dart' as _i41;
import '../../src/admin/subscriptions/data/data_source/all_subscription_datasource.dart'
    as _i3;
import '../../src/admin/subscriptions/data/repositories/all_subscription_repo.dart'
    as _i22;
import '../../src/admin/subscriptions/presentation/cubit/subscriptions_cubit.dart'
    as _i23;
import '../../src/shared/auth/data/data_sources/auth_datasource.dart' as _i5;
import '../../src/shared/auth/data/data_sources/forgot_password_datasource.dart'
    as _i10;
import '../../src/shared/auth/data/repositories/auth_repo.dart' as _i7;
import '../../src/shared/auth/data/repositories/forgot_password_repo.dart'
    as _i29;
import '../../src/shared/auth/domain/repositories/base_auth_repo.dart' as _i6;
import '../../src/shared/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i28;
import '../../src/shared/auth/domain/use_cases/auth_usecase.dart' as _i27;
import '../../src/shared/auth/domain/use_cases/forgot_password_usecase.dart'
    as _i33;
import '../../src/shared/auth/presentation/bloc/auth_bloc.dart' as _i46;
import '../../src/shared/auth/presentation/bloc/forgot_password_bloc.dart'
    as _i47;
import '../../src/shared/settings/data/data_sources/settings_datasource.dart'
    as _i20;
import '../../src/shared/settings/data/repositories/settings_repo.dart' as _i31;
import '../../src/shared/settings/domain/repositories/base_settings_repo.dart'
    as _i30;
import '../../src/shared/settings/domain/use_cases/settings_usecase.dart'
    as _i43;
import '../../src/shared/settings/presentation/bloc/about_us_bloc.dart' as _i45;
import '../../src/shared/settings/presentation/bloc/language_bloc.dart' as _i11;
import '../../src/shared/support/data/data_sources/support_datasource.dart'
    as _i24;
import '../../src/shared/support/data/repositories/support_repo.dart' as _i25;
import '../../src/shared/support/presentation/bloc/support_bloc.dart' as _i44;
import '../../src/user/favourite/data/data_sources/favourite_datasource.dart'
    as _i8;
import '../../src/user/favourite/data/repositories/favourite_repo.dart' as _i9;
import '../../src/user/favourite/presentation/cubit/favourite_cubit.dart'
    as _i32;
import '../../src/user/profile_user/presentation/cubit/user_profile_cubit.dart'
    as _i26;
import '../../src/user/service_user/data/data_sources/service_user_datasource.dart'
    as _i18;
import '../../src/user/service_user/data/repositories/service_user_repo.dart'
    as _i19;
import '../../src/user/service_user/presentation/service_map/cubit/marker_map_cubit.dart'
    as _i34;
import '../../src/user/service_user/presentation/user_service/cubit/service_user_cubit.dart'
    as _i42;
import '../widgets/more_feature/cubit/more_cubit.dart' as _i35;
import 'injection_module.dart' as _i48;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.AllSubscriptionDataSource>(
      () => _i3.AllSubscriptionDataSource(gh<_i4.Dio>()));
  gh.factory<_i5.AuthDataSource>(() => _i5.AuthDataSource(gh<_i4.Dio>()));
  gh.factory<_i6.BaseAuthRepo>(() => _i7.AuthRepo(gh<_i5.AuthDataSource>()));
  gh.factory<_i8.FavouriteDataSource>(
      () => _i8.FavouriteDataSource(gh<_i4.Dio>()));
  gh.factory<_i9.FavouriteRepository>(
      () => _i9.FavouriteRepository(gh<_i8.FavouriteDataSource>()));
  gh.factory<_i10.ForgotPasswordDataSource>(
      () => _i10.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i11.LanguageCubit>(() => _i11.LanguageCubit());
  gh.factory<_i12.NotificationsDataSource>(
      () => _i12.NotificationsDataSource(gh<_i4.Dio>()));
  gh.factory<_i13.NotificationsRepository>(
      () => _i13.NotificationsRepository(gh<_i12.NotificationsDataSource>()));
  gh.factory<_i14.ProfileDataSource>(
      () => _i14.ProfileDataSource(gh<_i4.Dio>()));
  gh.factory<_i15.ProfileRepository>(
      () => _i15.ProfileRepository(gh<_i14.ProfileDataSource>()));
  gh.factory<_i16.ServiceDataSource>(
      () => _i16.ServiceDataSource(gh<_i4.Dio>()));
  gh.factory<_i17.ServiceRepository>(
      () => _i17.ServiceRepository(gh<_i16.ServiceDataSource>()));
  gh.factory<_i18.ServiceUserDataSource>(
      () => _i18.ServiceUserDataSource(gh<_i4.Dio>()));
  gh.factory<_i19.ServiceUserRepository>(
      () => _i19.ServiceUserRepository(gh<_i18.ServiceUserDataSource>()));
  gh.factory<_i20.SettingsDatasource>(
      () => _i20.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i21.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i22.SubscriptionRepository>(
      () => _i22.SubscriptionRepository(gh<_i3.AllSubscriptionDataSource>()));
  gh.factory<_i23.SubscriptionsCubit>(
      () => _i23.SubscriptionsCubit(gh<_i22.SubscriptionRepository>()));
  gh.factory<_i24.SupportDatasource>(
      () => _i24.SupportDatasource(gh<_i4.Dio>()));
  gh.factory<_i25.SupportRepo>(
      () => _i25.SupportRepo(gh<_i24.SupportDatasource>()));
  gh.factory<_i26.UserProfileCubit>(
      () => _i26.UserProfileCubit(gh<_i15.ProfileRepository>()));
  gh.factory<_i27.AuthUseCase>(() => _i27.AuthUseCase(gh<_i6.BaseAuthRepo>()));
  gh.factory<_i28.BaseForgotPasswordRepo>(
      () => _i29.ForgotPasswordRepo(gh<_i10.ForgotPasswordDataSource>()));
  gh.factory<_i30.BaseSettingsRepo>(
      () => _i31.SettingsRepo(gh<_i20.SettingsDatasource>()));
  gh.factory<_i32.FavouriteCubit>(() => _i32.FavouriteCubit(
        gh<_i9.FavouriteRepository>(),
        gh<_i19.ServiceUserRepository>(),
      ));
  gh.factory<_i33.ForgotPasswordUseCase>(
      () => _i33.ForgotPasswordUseCase(gh<_i28.BaseForgotPasswordRepo>()));
  gh.factory<_i34.MarkerMapCubit>(() => _i34.MarkerMapCubit(
        gh<_i19.ServiceUserRepository>(),
        gh<_i9.FavouriteRepository>(),
      ));
  gh.factory<_i35.MoreCubit>(
      () => _i35.MoreCubit(gh<_i15.ProfileRepository>()));
  gh.factory<_i36.NotificationCubit>(
      () => _i36.NotificationCubit(gh<_i13.NotificationsRepository>()));
  gh.factory<_i37.OtpMessageCubit>(
      () => _i37.OtpMessageCubit(gh<_i27.AuthUseCase>()));
  gh.factory<_i38.PaymentCubit>(
      () => _i38.PaymentCubit(gh<_i22.SubscriptionRepository>()));
  gh.factory<_i39.ProfileServiceProviderCubit>(
      () => _i39.ProfileServiceProviderCubit(
            gh<_i19.ServiceUserRepository>(),
            gh<_i15.ProfileRepository>(),
            gh<_i17.ServiceRepository>(),
            gh<_i27.AuthUseCase>(),
          ));
  gh.factory<_i40.ProfileUserCubit>(() => _i40.ProfileUserCubit(
        gh<_i15.ProfileRepository>(),
        gh<_i27.AuthUseCase>(),
      ));
  gh.factory<_i41.ServiceCubit>(
      () => _i41.ServiceCubit(gh<_i17.ServiceRepository>()));
  gh.factory<_i42.ServiceUserCubit>(() => _i42.ServiceUserCubit(
        gh<_i19.ServiceUserRepository>(),
        gh<_i17.ServiceRepository>(),
      ));
  gh.factory<_i43.SettingsUseCase>(
      () => _i43.SettingsUseCase(gh<_i30.BaseSettingsRepo>()));
  gh.factory<_i44.SupportCubit>(
      () => _i44.SupportCubit(gh<_i25.SupportRepo>()));
  gh.factory<_i45.AboutUsCubit>(
      () => _i45.AboutUsCubit(gh<_i43.SettingsUseCase>()));
  gh.factory<_i46.AuthCubit>(() => _i46.AuthCubit(gh<_i27.AuthUseCase>()));
  gh.factory<_i47.ForgotPasswordCubit>(
      () => _i47.ForgotPasswordCubit(gh<_i33.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i48.InjectionModule {}
