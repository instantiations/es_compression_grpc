// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'package:es_compression_grpc/es_compression_grpc.dart';
import 'package:grpc/grpc.dart';
import 'package:helloworld/src/generated/helloworld.pbgrpc.dart';

/// Return a new [List] of gRPC compression [Codec]s
const codecs = [
  BrotliCodec(),
  GzipCodec(),
  Lz4Codec(),
  ZstdCodec(),
  IdentityCodec()
];

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async =>
      HelloReply()..message = 'Hello, ${request.name}!';
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: codecs),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
