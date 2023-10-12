import 'package:dinamik_ortalama_hesaplama/constants/index.dart';
import 'package:dinamik_ortalama_hesaplama/helpers/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/models/Ders.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _secilenDeger = 4;
  int _secilenKredi = 1;
  String _girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
            child: Text(
          Constants.appBarTitle,
          style: Constants.appBarTitleStyle,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Constants.mainColor),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Form
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: _buildForm(),
                    )),
                Expanded(
                    flex: 1,
                    child: OrtalamaGoster(
                      ortalama: DataHelper.ortalamaHesapla(),
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                    )),
              ],
            ),
            // List
            Expanded(
              child: DersListesi(
                onDismiss: (index) {
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        _buildTextFormField(),
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              _buildKrediler(),
              IconButton(
                  onPressed: _dersVeOrtalamaHesapla,
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Constants.mainColor,
                    size: 32,
                  )),
            ],
          ),
        )
      ]),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _girilenDersAdi = value!;
        });
      },
      validator: (value) {
        if (value!.length > 0) {
          return null;
        } else {
          return 'Ders adı boş olamaz';
        }
      },
      decoration: InputDecoration(
        hintText: 'Ders adı',
        border: Constants.textFieldBorder,
        filled: true,
        fillColor: Constants.mainColor.shade100,
      ),
    );
  }

  _buildHarfler() {
    return Container(
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100,
          border: Border.all(color: Constants.mainColor.shade400),
          borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
      child: DropdownButton<double>(
        value: _secilenDeger,
        onChanged: (value) {
          setState(() {
            _secilenDeger = value!;
          });
        },
        items: DataHelper.tumDersler(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100,
          border: Border.all(color: Constants.mainColor.shade400),
          borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
      child: DropdownButton<int>(
        value: _secilenKredi,
        onChanged: (value) {
          setState(() {
            _secilenKredi = value!;
          });
        },
        items: DataHelper.tumKrediler(),
      ),
    );
  }

  _dersVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: _girilenDersAdi,
          harfDegeri: _secilenDeger,
          krediDegeri: _secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
