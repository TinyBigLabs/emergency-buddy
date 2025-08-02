import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emergency_buddy/core/di/injection_container.config.dart';
import 'package:emergency_buddy/core/network/network_info.dart';
import 'package:emergency_buddy/domain/repositories/first_aid_repository.dart';
import 'package:emergency_buddy/domain/usecases/get_first_aid_home_screen_listing_usecase.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @LazySingleton(as: NetworkInfo)
  NetworkInfoImpl get networkInfo => NetworkInfoImpl(sl());

  //repositories
  @LazySingleton(as: FirstAidRepository)
  FirstAidRepositoryImpl get firstAidRepository => FirstAidRepositoryImpl();

  //usecases
  @factoryMethod
  GetHomeScreenFirstAidListingUseCase get getHomeScreenFirstAid =>
      GetHomeScreenFirstAidListingUseCase(firstAidRepository: sl());

  //cubits
  @factoryMethod
  FirstAidCubit get firstAidCubit => FirstAidCubit(getFirstAidUsecase: sl());
}

Future<void> init() async {
  // Offline persistence only needed for non-web platforms
  if (!kIsWeb) {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
  await configureDependencies();
}
