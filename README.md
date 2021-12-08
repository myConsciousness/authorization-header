**_A most easily usable authorization header management library in Dart!_**

[![pub package](https://img.shields.io/pub/v/authorization_header.svg)](https://pub.dev/packages/authorization_header)
[![Dart](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml/badge.svg)](https://github.com/myConsciousness/auth-header/actions/workflows/dart.yml)

<!-- TOC -->

- [1. About](#1-about)
  - [1.1. Supported](#11-supported)
    - [1.1.1. Authorization Header](#111-authorization-header)
    - [1.1.2. Authorization Type](#112-authorization-type)
  - [1.2. Introduction](#12-introduction)
    - [1.2.1. Install Library](#121-install-library)
    - [1.2.2. Import It](#122-import-it)
    - [1.2.3. Use AuthorizationHeader](#123-use-authorizationheader)
  - [1.3. License](#13-license)
  - [1.4. More Information](#14-more-information)

<!-- /TOC -->

# 1. About

`AuthorizationHeader` is an open-sourced Dart library.</br>
With `AuthorizationHeader`, you can easily manage authorization header on your application.

The `AuthorizationHeader` library provides a common features for generating authorization header for use with Basic or Bearer authorization.</br>
Proxy-Authorization for proxies is also supported.

By using the `AuthorizationHeader` library, there is no need for redundant implementation or research to generate the authorization header anymore!

## 1.1. Supported

### 1.1.1. Authorization Header

| Name                |
| ------------------- |
| Authorization       |
| Proxy-Authorization |

### 1.1.2. Authorization Type

| Name   | RFC                                                       |
| ------ | --------------------------------------------------------- |
| Basic  | [RFC 7617](https://datatracker.ietf.org/doc/html/rfc7617) |
| Bearer | [RFC 6750](https://datatracker.ietf.org/doc/html/rfc6750) |

## 1.2. Introduction

### 1.2.1. Install Library

**_With Dart:_**

```terminal
 dart pub add authorization_header
```

**_With Flutter:_**

```terminal
 flutter pub add authorization_header
```

### 1.2.2. Import It

```dart
import 'package:authorization_header/authorization_header.dart';
```

### 1.2.3. Use AuthorizationHeader

`AuthorizationHeader` can be used in conjunction with the [http](https://pub.dev/packages/http) package as follows.

```dart
import 'package:authorization_header/authorization_header.dart';
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

## 1.3. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.4. More Information

`AuthorizationHeader` was designed and implemented by **_Kato Shinya_**.

- [Creator Profile](https://github.com/myConsciousness)
- [License](https://github.com/myConsciousness/auth-header/blob/main/LICENSE)
- [API Document](https://pub.dev/documentation/authorization_header/latest/authorization_header/authorization_header-library.html)
- [Release Note](https://github.com/myConsciousness/auth-header/releases)
- [Bug Report](https://github.com/myConsciousness/auth-header/issues)
