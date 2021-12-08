// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// This abstract class represents a strategy for generating authorization token.
abstract class AuthTokenStrategy {
  /// Returns an authorization token according to the authorization method.
  String execute();
}
