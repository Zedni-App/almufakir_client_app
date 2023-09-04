import 'package:flutter/material.dart';
import 'package:zidne/domain_layer/entities/user_entity.dart';
import 'package:zidne/domain_layer/use_cases/profile/update_data.dart';

import '../../core/utilities/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sl<UpdateUserDataUseCase>().call(
                user: const UserEntity(
              id: 6,
              name: "Saifo",
              email: "seif@gmail.com",
              phone: "+963992611936",
              password: "19998ssss",
              imageUrl: "h",
            ));
          },
          child: const Text("Click me"),
        ),
      ),
    );
  }
}
