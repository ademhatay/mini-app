import 'package:dinamik_ortalama_hesaplama/constants/index.dart';
import 'package:dinamik_ortalama_hesaplama/helpers/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/models/Ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return (tumDersler.length > 0)
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ad),
                    leading: CircleAvatar(
                      backgroundColor: Constants.mainColor,
                      child: Text(
                        ((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: Colors.red.shade400,
                    ),
                    subtitle: Text(
                        '${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri} '),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              'Lütfen Ders Ekleyin',
              style: Constants.appBarTitleStyle,
            ),
          );
  }
}
