import 'package:dinamik_ortalama_hesaplama/models/Ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    int toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot += element.krediDegeri * element.harfDegeri;
      toplamKredi += element.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }

  static List<String> _tumDersNotlari() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FF',
    ];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FF':
        return 0.0;
      default:
        return 0.0;
    }
  }

  static List<DropdownMenuItem<double>> tumDersler() {
    return _tumDersNotlari()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<int>> tumKrediler() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }
}
