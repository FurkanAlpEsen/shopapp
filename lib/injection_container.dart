import 'package:get_it/get_it.dart';
import 'package:shopapp/exception_handler.dart';
import 'package:shopapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:shopapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopapp/features/home/data/datasources/remote/product_service.dart';
import 'package:shopapp/features/home/data/repositories/product_repository_impl.dart';
import 'package:shopapp/features/home/domain/repositories/product_repository.dart';
import 'package:shopapp/features/home/domain/usecases/get_products.dart';
import 'package:shopapp/features/home/presentation/bloc/basket/basket_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/remote/remote_products_bloc.dart';
import 'package:shopapp/features/auth/data/datasources/remote/login_service.dart';
import 'package:shopapp/features/auth/data/datasources/remote/register_service.dart';
import 'package:shopapp/features/home/presentation/bloc/home/home_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Route
  // sl.registerSingleton<AppRoutes>(AppRoutes());

  //service
  sl.registerSingleton<LoginService>(LoginService());
  sl.registerSingleton<RegisterService>(RegisterService());

  sl.registerSingleton<ProductService>(ProductService());

  //repo
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(sl()));

  //usecase
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));

  //bloc
  sl.registerFactory<RemoteProductsBloc>(() => RemoteProductsBloc(sl()));
  // sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));
  // sl.registerFactory<BasketBloc>(() => BasketBloc(sl()));
  // sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));

  sl.registerSingleton<MyHandler>(MyHandler());
  // sl.registerFactory<MyHandler>(() => MyHandler());
}
