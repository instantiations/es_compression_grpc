// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

/// GRPC compression codec extensions library
///
/// To use this library in your code:
/// ```
/// import 'package:es_compression_grpc/codec.dart';
/// ```
library codec;

export 'src/brotli/codec.dart' show BrotliCodec;
export 'src/lz4/codec.dart' show Lz4Codec;
export 'src/zstd/codec.dart' show ZstdCodec;