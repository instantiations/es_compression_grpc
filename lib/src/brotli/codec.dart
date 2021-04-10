// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'package:es_compression/brotli.dart';
import 'package:grpc/grpc.dart' as grpc;

/// A brotli compressor and decompressor.
class BrotliCodec implements grpc.Codec {
  /// Brotli compression level to use.
  /// see [BrotliEncoder.level] for a value range.
  final int compressionLevel;

  /// Brotli gRPC codec constructor
  const BrotliCodec({this.compressionLevel = BrotliOption.defaultLevel});

  @override
  final encodingName = 'brotli';

  @override
  List<int> compress(List<int> data) {
    return BrotliEncoder(level: compressionLevel).convert(data);
  }

  @override
  List<int> decompress(List<int> data) {
    return BrotliDecoder().convert(data);
  }
}
