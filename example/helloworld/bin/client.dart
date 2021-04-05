// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'package:es_compression_grpc/codec.dart';

import 'package:grpc/grpc.dart';
import 'package:helloworld/src/generated/helloworld.pb.dart';
import 'package:helloworld/src/generated/helloworld.pbgrpc.dart';

/// Return a new [List] of gRPC compression [Codec]s
const codecs = [
  BrotliCodec(),
  GzipCodec(),
  Lz4Codec(),
  ZstdCodec(),
  IdentityCodec()
];

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(codecs: codecs),
    ),
  );
  final stub = GreeterClient(channel);

  for (final codec in codecs) {
    try {
      final response = await stub.sayHello(
        HelloRequest()..name = codec.encodingName,
        options: CallOptions(compression: codec),
      );
      print('Greeter client received: ${response.message}');
    } catch (e) {
      print('Caught error: $e');
    }
  }

  await channel.shutdown();
}
