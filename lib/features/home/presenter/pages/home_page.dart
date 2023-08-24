import 'package:asksql/core/states/get_sqlcode_state.dart';
import 'package:asksql/core/style/colors.dart';
import 'package:asksql/features/home/data/get_sqlcode_data.dart';
import 'package:asksql/features/home/presenter/controllers/home_controller.store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = HomeController(
    data: GetSqlCodeData(
      dio: Dio(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueBerry,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(controller: controller),
                  Text(
                    "Cole seu código SQL aqui",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.20,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xff151a2a),
                      border: Border.all(
                        color: const Color(0xff2c2c2c),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextField(
                      controller: controller.tableController,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Faça uma pergunta sobre o código",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff151a2a),
                      border: Border.all(
                        color: const Color(0xff2c2c2c),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextField(
                      controller: controller.questionController,
                      maxLines: 2,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Digite sua duvida...",
                        hintStyle: GoogleFonts.inter(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.tableController.text.isNotEmpty &&
                            controller.questionController.text.isNotEmpty) {
                          String body = """
A partir dessa tabela aqui ${controller.tableController.text} ${controller.questionController.text}
""";
                          controller.getSqlCode(body);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          side: BorderSide(
                            color: AppColors.pistacho,
                          ),
                        ),
                      ),
                      child: Observer(builder: (context) {
                        return controller.state.runtimeType ==
                                LoadingGetSqlCodeState
                            ? CircularProgressIndicator(
                                color: AppColors.pistacho)
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bubble_chart,
                                    color: AppColors.pistacho,
                                    size: 32,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Perguntar á inteligência artificial",
                                    style: GoogleFonts.inter(
                                      color: AppColors.pistacho,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              );
                      }),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Resposta",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff151a2a),
                      border: Border.all(
                        color: const Color(0xff2c2c2c),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Observer(
                      builder: (context) {
                        return TextField(
                          enabled: false,
                          controller: controller.responseController,
                          maxLines: 2,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.inter(color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
