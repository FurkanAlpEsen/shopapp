import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth/domain/entities/user_entity.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:shopapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/basket/basket_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/remote/remote_products_bloc.dart';
import 'package:shopapp/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:shopapp/features/home/presentation/pages/home.dart';
import 'package:shopapp/features/home/data/datasources/remote/product_service.dart';
import 'package:shopapp/features/home/presentation/widgets/product_list.dart';
import 'package:shopapp/injection_container.dart';
import 'package:shopapp/features/auth/presentation/pages/login_page.dart';
import 'package:shopapp/features/auth/presentation/pages/register_page.dart';

import 'features/home/data/models/product.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteProductsBloc>(
          create: (context) => (sl()..add(const GetProducts())),
        ),
        BlocProvider(
          create: (context) => HomeBloc(HomeState(0)),
        ),
        BlocProvider(
            create: (context) => BasketBloc(BasketState(products: []))),

        //? Buradaki state initial oldugunda degismiyor geri gelecegim.
        BlocProvider(
          create: (context) => AuthBloc(
              AuthState(
                  entity: UserEntity(1, 'userName', 'email', 'password'),
                  exception: ''),
              sl(),
              sl()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
      ),
    );
  }
}
