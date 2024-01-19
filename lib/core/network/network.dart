import 'package:ecommerece_riverpod/core/network/rest_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) {
    return RestClient(
      baseUrl: 'https://fakestoreapi.com/',
      token: '',
    );
  },
);
