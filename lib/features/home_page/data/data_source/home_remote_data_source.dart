import 'dart:convert';

import "package:ekub_application/core/error/exception.dart";
import 'package:ekub_application/features/home_page/data/models/equb_model.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';

abstract interface class HomeRemoteDataResource {
  Future<List<EqubModel>> LoadEqubDataFromLocal();
  Future<List<EqubModel>> LoadUserDataFromLocal();
}

class HomeRemoteDataResourceImplm implements HomeRemoteDataResource {
  @override
  Future<List<EqubModel>> LoadEqubDataFromLocal() async {
    List<EqubModel> equbModel = [];
    try {
      print("...on server loading...");
      final res = await rootBundle.loadString("assets/equbs.json");
      final decodedData = jsonDecode(res);
      if (decodedData is! Map<String, dynamic> ||
          !decodedData.containsKey("equbs")) {
        throw FormatException("Invalid JSON format - expected 'equbs' key");
      }
      List equbs = decodedData["equbs"];

      for (int i = 0; i < equbs.length; i++) {
        Map<String, dynamic> data = equbs[i];
        equbModel.add(EqubModel.fromJson(data));
        print("...${i}...");
      }
      await Future.delayed(const Duration(seconds: 2));
      return equbModel;
    } catch (e) {
      print("...${e.toString()}...");
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<EqubModel>> LoadUserDataFromLocal() {
    // TODO: implement LoadUserDataFromLocal
    throw UnimplementedError();
  }
}
