**_A most easily usable authorization header management library in Dart!_**

[![pub package](https://img.shields.io/pub/v/authorization_header.svg)](https://pub.dev/packages/authorization_header)
[![Dart](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml/badge.svg)](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml)

<!-- TOC -->

- [1. About](#1-about)
  - [1.1. Introduction](#11-introduction)
    - [1.1.1. Install Library](#111-install-library)
    - [1.1.2. Import It](#112-import-it)
    - [1.1.3. Use AuthorizationHeader](#113-use-authorizationheader)
  - [1.2. License](#12-license)
  - [1.3. More Information](#13-more-information)

<!-- /TOC -->

# 1. About

`AuthorizationHeader` is an open-sourced Dart library.</br>
With `AuthorizationHeader`, you can easily manage authorization header on your application.

## 1.1. Introduction

### 1.1.1. Install Library

**_With Dart:_**

```terminal
 dart pub add authorization_header
```

**_With Flutter:_**

```terminal
 flutter pub add authorization_header
```

### 1.1.2. Import It

```dart
import 'package:authorization_header/auth_header.dart';
```

### 1.1.3. Use AuthorizationHeader

```dart
import 'package:authorization_header/auth_header.dart';
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
```

## 1.2. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.3. More Information

`AuthorizationHeader` was designed and implemented by **_Kato Shinya_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/auth-header/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/authorization_header/latest/authorization_header/authorization_header-library.html)
- [Release Note](https://github.com/myConsciousness/auth-header/releases)
- [Bug Report](https://github.com/myConsciousness/auth-header/issues)
