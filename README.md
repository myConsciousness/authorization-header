**_A most easily usable authorization header management library in Dart!_**

[![pub package](https://img.shields.io/pub/v/auth_header.svg)](https://pub.dev/packages/auth_header)
[![Dart](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml/badge.svg)](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml)

<!-- TOC -->

- [1. About](#1-about)
  - [1.1. Introduction](#11-introduction)
    - [1.1.1. Install Library](#111-install-library)
    - [1.1.2. Import It](#112-import-it)
    - [1.1.3. Use AuthHeader](#113-use-authheader)
  - [1.2. License](#12-license)
  - [1.3. More Information](#13-more-information)

<!-- /TOC -->

# 1. About

`AuthHeader` is an open-sourced Dart library.</br>
With `AuthHeader`, you can easily manage authorization header on your application.

## 1.1. Introduction

### 1.1.1. Install Library

**_With Dart:_**

```terminal
 dart pub add auth_header
```

**_With Flutter:_**

```terminal
 flutter pub add auth_header
```

### 1.1.2. Import It

```dart
import 'package:auth_header/auth_header.dart';
```

### 1.1.3. Use AuthHeader

```dart
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

```

## 1.2. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.3. More Information

`AuthHeader` was designed and implemented by **_Kato Shinya_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/auth-header/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/auth_header/latest/auth_header/auth_header-library.html)
- [Release Note](https://github.com/myConsciousness/auth-header/releases)
- [Bug Report](https://github.com/myConsciousness/auth-header/issues)
