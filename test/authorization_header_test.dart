// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:authorization_header/authorization_header.dart';

void main() {
  group('Test DefaultAuthorization.', () {
    test('Test basic.', () {
      final header = Authorization.of().basic(
        username: 'test',
        password: 'test_password',
      );

      expect(header.name, 'Authorization');
      expect(header.value, 'Basic dGVzdDp0ZXN0X3Bhc3N3b3Jk');
    });

    test('Test bearer.', () {
      final header = Authorization.of().bearer(token: 'test');

      expect(header.name, 'Authorization');
      expect(header.value, 'Bearer test');
    });
  });

  group('Test ProxyAuthorization.', () {
    test('Test basic.', () {
      final header = Authorization.ofProxy().basic(
        username: 'test',
        password: 'test_password',
      );

      expect(header.name, 'Proxy-Authorization');
      expect(header.value, 'Basic dGVzdDp0ZXN0X3Bhc3N3b3Jk');
    });

    test('Test bearer.', () {
      final header = Authorization.ofProxy().bearer(token: 'test');

      expect(header.name, 'Proxy-Authorization');
      expect(header.value, 'Bearer test');
    });
  });
}
