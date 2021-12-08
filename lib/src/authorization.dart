// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:authorization_header/src/authorization_header.dart';
import 'package:authorization_header/src/default_authorization.dart';
import 'package:authorization_header/src/proxy_authorization.dart';

/// This abstract class provides the ability to generate authorization header
/// according to the authorization method.
///
/// There are two types of authorization header: **_Authorization_** and **_Proxy-Authorization_** for proxies,
/// but with [Authorization] class, you can easily solve the problem by using the two different constructors.
///
/// If you want to create an authrization header that follows the **_Authorization_** method,
/// create an instance from [Authorization.of]. And to create an authrization header that follows
/// the **_Proxy-Authorization_** method, create an instance from [Authorization.ofProxy].
///
/// Both **_Authorization_** and **_Proxy-Authorization_** methods support Basic and Bearer authorization methods.
///
/// To obtain the authorization header for basic authorization, pass the username and password to the [basic] method.
/// Base64-encrypted tokens for basic authorization are stored as [AuthorizationHeader The base64 encrypted token for
/// Basic authorization will be returned as [AuthorizationHeader].
///
/// To obtain the authorization header for Bearer authorization, pass the token to be used for authorization
/// to the [bearer] method, and the token for Bearer authorization will be returned as [AuthorizationHeader].
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
abstract class Authorization {
  /// Returns the new instance of [Authorization].
  factory Authorization.of() => Authorization._();

  /// Returns the new instance of proxy [Authorization].
  factory Authorization.ofProxy() => Authorization._(proxy: true);

  /// Returns the new instance of [Authorization] based on [proxy] flag.
  factory Authorization._({bool proxy = false}) => proxy
      ? ProxyAuthorization.newInstance()
      : DefaultAuthorization.newInstance();

  /// Returns the [AuthorizationHeader] to be used for basic authorization.
  /// The token returned by this method is the base64-encoded credentials.
  ///
  /// The arguments should be [username] and [password] used for Basic authorization.
  /// The [username] and [password] passed as arguments will be encrypted in base64 format according to the
  /// Basic authorization specifications, and will be set in [AuthorizationHeader.value] of [AuthorizationHeader].
  ///
  /// This credential information is based on the [RFC 7617](https://datatracker.ietf.org/doc/html/rfc7617) specification.
  AuthorizationHeader basic({
    required String username,
    required String password,
  });

  /// Returns the [AuthorizationHeader] to be used for bearer authorization.
  /// The token returned by this method is a bearer token for accessing resources protected by OAuth 2.0.
  ///
  /// The arguments should be [token] used for Bearer authorization. The [token] for Bearer authorization
  /// will be set in [AuthorizationHeader.value] of [AuthorizationHeader].
  ///
  /// This credential information is based on the [RFC 6750](https://datatracker.ietf.org/doc/html/rfc6750) specification.
  AuthorizationHeader bearer({
    required String token,
  });
}
