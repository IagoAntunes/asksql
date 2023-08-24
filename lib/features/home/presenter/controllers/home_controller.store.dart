import 'package:asksql/core/states/get_sqlcode_state.dart';
import 'package:asksql/features/home/data/get_sqlcode_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.store.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController({required this.data});
  final IGetSqlCodeData data;
  @observable
  IGetSqlCodeState state = IdleGetSqlCodeState();
  @observable
  TextEditingController tableController = TextEditingController();
  @observable
  TextEditingController questionController = TextEditingController();
  @observable
  TextEditingController responseController = TextEditingController();
  @observable
  String? response;

  @action
  getSqlCode(String body) async {
    state = LoadingGetSqlCodeState();
    await data.getSqlCode(body).then((value) {
      value.fold((l) {
        responseController.text = "Ocorreu um problema! Tente Novamente.";
      }, (r) {
        responseController.text = r.text;
      });
    });
    state = SuccesGetSqlCodeState();
  }
}
