import 'package:es_compression/lz4.dart';
import 'package:grpc/grpc.dart' as grpc;

/// An lz4 compressor and decompressor.
class Lz4Codec implements grpc.Codec {
  const Lz4Codec();

  @override
  final encodingName = 'lz4';

  @override
  List<int> compress(List<int> data) {
    return Lz4Encoder().convert(data);
  }

  @override
  List<int> decompress(List<int> data) {
    return Lz4Decoder().convert(data);
  }
}
