// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:authorization_header/src/strategy/auth_token_strategy.dart';

/// This class represents a strategy for token generation in the Basic authorization method.
class BasicAuthTokenStrategy extends AuthTokenStrategy {
  /// Returns the new instance of [BasicAuthTokenStrategy] based on arguments.
  BasicAuthTokenStrategy.from({
    required this.username,
    required this.password,
  });

  /// The username
  final String username;

  /// The password
  final String password;

  @override
  String execute() =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}
