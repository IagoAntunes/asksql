import 'package:asksql/features/home/presenter/controllers/home_controller.store.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/Logo.png"),
        IconButton(
          onPressed: () {
            controller.questionController.text = "";
            controller.tableController.text = "";
            controller.responseController.text = "";
          },
          icon: const Icon(
            Icons.delete_outline,
            size: 32,
          ),
        )
      ],
    );
  }
}
