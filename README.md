[![Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev)
[![pub package](https://img.shields.io/pub/v/es_compression_grpc.svg)](https://pub.dartlang.org/packages/es_compression_grpc)

# ES Compression gRPC: gRPC Compression Extensions for Dart

## Description
Provides additional gRPC message compression support for the [grpc-dart](https://pub.dev/packages/grpc). Additional
compression algorithms include Brotli, Lz4, Zstd (Zstandard) via integration with
[es_compression](https://pub.dev/packages/es_compression).

## Examples
In the `example` subdirectory, the following examples are provided to demonstrate usage of the converters and the
framework.

| Example          | Description                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------- |
| `helloworld`     | Example client/server usage of gRPC library to perform unary RPCs with various compression schemes |

## Tests
In the `test` subdirectory, the following tests are provided.

| Test                    | Description                                             |
| ------------------------| ------------------------------------------------------- |
| `codec_tests.dart`      | Test encoding/decode of the various compression codecs  |
| `helloworld_tests.dart` | Test the helloworld client/server example               |

To run test suite:
```console
> pub run test
```

## Features and bugs
Please file feature requests and bugs at the [issue tracker][tracker].

They will be reviewed and addressed on a best-effort basis by [Instantiations, Inc].

[tracker]: https://github.com/instantiations/es_compression_grpc/issues
[VAST Platform]: https://www.instantiations.com/vast-platform
[Instantiations, Inc]: https://www.instantiations.com

## About Us

Since 1988, Instantiations has been building software to meet the diverse and evolutionary needs of our customers. We've now added Dart and Flutter to our toolbox.
	
For more information about our custom development or consulting services with Dart, Flutter, and other languages, please visit: https://www.instantiations.com/services/
