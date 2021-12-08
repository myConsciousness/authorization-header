// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This class represents the authorization header.
///
/// The name of the header will be set to [name],
/// and the token that will be the value of the header will be set to [value].
///
/// It can be used in conjunction with the http package as follows.
///
/// **_Example:_**
///
/// ```dart
/// import 'package:authorization_header/authorization_header.dart';
/// import 'package:http/http.dart' as http;
///
/// void main() async {
///   /// You can switch between Default and Proxy in the constructor.
///   final authHeader = Authorization.of().bearer(token: 'test_token');
///   final proxyAuthHeader = Authorization.ofProxy().bearer(token: 'test_token');
///
///   print(authHeader); // -> name: Authorization, value: Bearer test
///   print(proxyAuthHeader); // -> name: Proxy-Authorization, value: Bearer test
///
///   await http.post(
///     Uri.parse('https://test.com'),
///     headers: {
///       authHeader.name: authHeader.value,
///       proxyAuthHeader.name: proxyAuthHeader.value,
///     },
///   );
/// }
/// ```
class AuthorizationHeader {
  /// Returns the new instance of [AuthorizationHeader] based on arguments.
  AuthorizationHeader.from({
    required this.name,
    required this.value,
  });

  /// The name
  final String name;

  /// The value
  final String value;

  @override
  String toString() => 'AuthorizationHeader(name: $name, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorizationHeader &&
        other.name == name &&
        other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
