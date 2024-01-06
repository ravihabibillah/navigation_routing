// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:navigation_routing/halaman_kedua.dart';
import 'package:navigation_routing/halaman_kedua_dengan_data.dart';

class HalamanPertama extends StatelessWidget {
  const HalamanPertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation & Routing"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // Ini Kalau ga pake ROUTING
                  // Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //   return HalamanKedua();
                  // }));

                  // Ini kalau pakai ROUTING
                  Navigator.pushNamed(context, '/halaman-kedua');
                },
                child: Text(
                  'Go To Second Screen',
                )),
            ElevatedButton(
                onPressed: () {
                  // Pakai ROUTING
                  Navigator.pushNamed(context, '/halaman-kedua-dengan-data',
                      arguments: 'Haloooooooo, Nama saya Udin');

                  // Tanpa ROUTING
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HalamanKeduaDenganData(
                        data: 'Haloooooooo, Nama saya Udin');
                  }));
                },
                child: Text(
                  'Navigation with Data',
                )),
            ElevatedButton(
                onPressed: () async {
                  var scaffoldMessenger = ScaffoldMessenger.of(context);
                  var hasil =
                      await Navigator.pushNamed(context, '/mengembalikan-data');

                  var snackbar = SnackBar(
                    content: Text('$hasil'),
                  );

                  scaffoldMessenger.showSnackBar(snackbar);

                  print(hasil);
                },
                child: Text(
                  'Return Data from another Screen',
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman-pengganti');
                },
                child: Text(
                  'Replace Screen',
                )),
          ],
        ),
      ),
    );
  }
}
