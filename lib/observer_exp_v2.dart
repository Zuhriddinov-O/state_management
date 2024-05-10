import 'package:flutter/cupertino.dart';
import 'package:state_management/api_service.dart';

class ObserverV2 extends ChangeNotifier {
  final List<Pigeon> pigeons = [];
  final _api = ApiServiceImpl();

  void getPigeons() async {
    final p = await _api.getPigeons();
    pigeons.addAll(p);
    notifyListeners();
  }
}
