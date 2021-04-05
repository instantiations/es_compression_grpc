import 'package:es_compression/brotli.dart';
import 'package:grpc/grpc.dart' as grpc;

/// A brotli compressor and decompressor.
class BrotliCodec implements grpc.Codec {
  const BrotliCodec();

  @override
  final encodingName = 'brotli';

  @override
  List<int> compress(List<int> data) {
    return BrotliEncoder().convert(data);
  }

  @override
  List<int> decompress(List<int> data) {
    return BrotliDecoder().convert(data);
  }
}
