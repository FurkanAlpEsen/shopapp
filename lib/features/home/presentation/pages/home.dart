import 'package:flutter/material.dart';
import 'package:shopapp/features/home/presentation/widgets/body_container.dart';

import 'package:shopapp/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:shopapp/features/home/presentation/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: CustomAppBar(),
      body: BodyContainer(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
