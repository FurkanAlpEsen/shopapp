import 'package:flutter/material.dart';
import 'package:shopapp/features/auth/presentation/pages/login_page.dart';
import 'package:shopapp/features/auth/presentation/pages/register_page.dart';
import 'package:shopapp/features/home/presentation/pages/home.dart';
import 'package:shopapp/features/home/presentation/pages/product_detail.dart';

//! Bu class main route a eklenmedi. Login bug lari bitince baglanacak.
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Home());

      case '/Login':
        return _materialRoute(LoginPage());

      case '/Register':
        return _materialRoute(RegisterPage());

      case '/ProductDetail':
        return _materialRoute(ProductDetail());

      default:
        return _materialRoute(const Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
