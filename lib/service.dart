import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersApi = StateProvider<int>((ref) {
  return 0;
});
final getRequest = FutureProvider((ref) async {
  final number = ref.watch(numbersApi);
  print(("===============$number+============"));
  return await Service().getNumbersInformation(number);
});

class Service {
  Future<String> getNumbersInformation(int number) async {
    var response = await Dio().get("http://numbersapi.com/$number");
    return response.data;
  }
}
