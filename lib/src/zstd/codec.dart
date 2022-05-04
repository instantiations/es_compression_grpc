// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'package:es_compression/zstd.dart';
import 'package:grpc/grpc.dart' as grpc;

/// A zstd compressor and decompressor.
class ZstdCodec implements grpc.Codec {
  /// Zstd compression level to use.
  /// see [ZstdEncoder.level] for a value range.
  final int compressionLevel;

  /// Zstd gRPC codec constructor
  const ZstdCodec({this.compressionLevel = ZstdOption.defaultLevel});

  @override
  final encodingName = 'zstd';

  @override
  List<int> compress(List<int> data) =>
      ZstdEncoder(level: compressionLevel).convert(data);

  @override
  List<int> decompress(List<int> data) => ZstdDecoder().convert(data);
}
