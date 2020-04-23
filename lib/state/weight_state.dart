import 'package:flutter/cupertino.dart';
import 'package:providersample/model/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _kilolar = [
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 01, 25)),
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 01, 30)),
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 02, 10)),
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 02, 24)),
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 03, 17)),
    Weight(kilo: 95.0, tarih: DateTime.utc(2020, 04, 23)),
  ];

  List<Weight> get kilolar => _kilolar;

  yeniKiloEkle(double deger) {
    _kilolar.insert(0, Weight(kilo: deger, tarih: DateTime.now()));
    notifyListeners();
  }
}
