// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:emergency_buddy/core/di/injection_container.dart' as _i527;
import 'package:emergency_buddy/core/network/network_info.dart' as _i452;
import 'package:emergency_buddy/domain/repositories/first_aid_repository.dart'
    as _i46;
import 'package:emergency_buddy/domain/usecases/get_first_aid_home_screen_listing_usecase.dart'
    as _i606;
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart'
    as _i343;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i606.GetHomeScreenFirstAidListingUseCase>(
        () => registerModule.getHomeScreenFirstAid);
    gh.factory<_i343.FirstAidCubit>(() => registerModule.firstAidCubit);
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.lazySingleton<_i46.FirstAidRepository>(
        () => registerModule.firstAidRepository);
    gh.lazySingleton<_i452.NetworkInfo>(() => registerModule.networkInfo);
    return this;
  }
}

class _$RegisterModule extends _i527.RegisterModule {}
