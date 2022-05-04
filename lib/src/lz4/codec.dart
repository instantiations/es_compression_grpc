// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'package:es_compression/lz4.dart';
import 'package:grpc/grpc.dart' as grpc;

/// An lz4 compressor and decompressor.
class Lz4Codec implements grpc.Codec {
  /// Lz4 compression level to use.
  /// see [Lz4Encoder.level] for a value range.
  final int compressionLevel;

  /// Lz4 gRPC codec constructor
  const Lz4Codec({this.compressionLevel = Lz4Option.defaultLevel});

  @override
  final encodingName = 'lz4';

  @override
  List<int> compress(List<int> data) =>
      Lz4Encoder(level: compressionLevel).convert(data);

  @override
  List<int> decompress(List<int> data) => Lz4Decoder().convert(data);
}
