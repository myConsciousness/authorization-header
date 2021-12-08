// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:authorization_header/src/strategy/auth_token_strategy.dart';

/// This class represents a strategy for token generation in the Bearer authorization method.
class BearerAuthTokenStrategy extends AuthTokenStrategy {
  /// Returns the new instance of [BearerAuthTokenStrategy] based on an argument.
  BearerAuthTokenStrategy.from({required this.token});

  /// The token
  final String token;

  @override
  String execute() => 'Bearer $token';
}
