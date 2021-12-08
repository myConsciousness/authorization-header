// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: avoid_print

import 'package:auth_header/auth_header.dart';
import 'package:http/http.dart' as http;

void main() async {
  /// You can switch between Default and Proxy in the constructor.
  final authHeader = Auth.of().bearer(token: 'test_token');
  final proxyAuthHeader = Auth.ofProxy().bearer(token: 'test_token');

  print(authHeader); // -> name: Authorization, value: Bearer test
  print(proxyAuthHeader); // -> name: Proxy-Authorization, value: Bearer test

  await http.post(
    Uri.parse('https://test.com'),
    headers: {
      authHeader.name: authHeader.value,
      proxyAuthHeader.name: proxyAuthHeader.value,
    },
  );
}
