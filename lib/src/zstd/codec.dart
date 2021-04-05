import 'package:es_compression/zstd.dart';
import 'package:grpc/grpc.dart' as grpc;

/// A zstd compressor and decompressor.
class ZstdCodec implements grpc.Codec {
  const ZstdCodec();

  @override
  final encodingName = 'zstd';

  @override
  List<int> compress(List<int> data) {
    return ZstdEncoder().convert(data);
  }

  @override
  List<int> decompress(List<int> data) {
    return ZstdDecoder().convert(data);
  }
}
