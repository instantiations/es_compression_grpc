// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:es_compression_grpc/codec.dart';
import 'package:test/test.dart';

void main() {
  test('Test Brotli Codec encoding name', () {
    const codec = BrotliCodec();
    expect(codec.encodingName, 'brotli');
  });

  test('Test Lz4 Codec encoding name', () {
    const codec = Lz4Codec();
    expect(codec.encodingName, 'lz4');
  });

  test('Test Zstd Codec encoding name', () {
    const codec = ZstdCodec();
    expect(codec.encodingName, 'zstd');
  });

  test('Test Codec Compress/Decompress', () {
    const codecs = [BrotliCodec(), Lz4Codec(), ZstdCodec()];
    for (final codec in codecs) {
      final testData = utf8.encode('Hello Dart!');
      expect(codec.decompress(codec.compress(testData)), testData);
    }
  });
}
