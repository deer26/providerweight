import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:providersample/state/weight_state.dart';

class WeightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kilo Takip"),
      ),
      body: Consumer<WeightState>(builder: (context, durum, child) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Şu anki Kilo",
                    textScaleFactor: 2,
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    durum.kilolar.first.kilo.toString(),
                    textScaleFactor: 2,
                    style: TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: durum.kilolar.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(durum.kilolar[index].tarih
                            .toString()
                            .substring(0, 10)),
                        trailing: Text(
                          durum.kilolar[index].kilo.toString(),
                          textScaleFactor: 2,
                        ),
                      );
                    }),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          double yeniKilo = await showDialog(
              context: context,
              builder: (context) {
                return NumberPickerDialog.decimal(
                    minValue: 30, maxValue: 200, initialDoubleValue: 45);
              });
          print(yeniKilo.toString());
          if (yeniKilo > 0 && yeniKilo != null) {
            Provider.of<WeightState>(context, listen: false)
                .yeniKiloEkle(yeniKilo);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
