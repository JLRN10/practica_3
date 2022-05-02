import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practica_3/firebase/imagenes_firebase.dart';

class ImagesScreen extends StatefulWidget {
  ImagesScreen({Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  ImagenesFirebase? _firebase; // Se crea la variable con la opcion de nulo
  @override
  void initState() {
    // TODO: implement initState
    _firebase =
        ImagenesFirebase(); // inicializamos la variable con la carga de los valores
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test FireBase'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebase!.getAllImages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(snapshot.data!.docs[index]
                          .get('imagen')), //Se pide que el objeto no se nulo
                    );
                  }, childCount: snapshot.data!.docs.length),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
