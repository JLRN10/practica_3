import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practica_3/models/image_models.dart';

class ImagenesFirebase {
  FirebaseFirestore? _firestore;
  CollectionReference? _imagenesCollection;

  ImagenesFirebase() {
    _firestore = FirebaseFirestore.instance;
    _imagenesCollection = _firestore!.collection("fotos");
  }

  Future<void> insImage(ImageDAO image) {
    return _imagenesCollection!.add(image);
  }

  Future<void> updImage(ImageDAO image) {
    return _imagenesCollection!.doc("ID").update(image.toMap());
  }

  Future<void> delImage(String ID) {
    return _imagenesCollection!.doc(ID).delete();
  }

  Stream<QuerySnapshot> getAllImages() {
    return _imagenesCollection!.snapshots();
  }
}
