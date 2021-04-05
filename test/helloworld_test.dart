// Copyright (c) 2021, Instantiations, Inc. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed by
// a BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:file_utils/file_utils.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  test('Test helloworld client/server', () async {
    TestProcess? server;
    TestProcess? client;

    final origPath = path.current;
    final helloWorldPath = path.join(path.current, 'example', 'helloworld');
    final serverPath =
        path.join(helloWorldPath, 'bin', 'server.dart');
    final clientPath =
        path.join(helloWorldPath, 'bin', 'client.dart');

    expect(File(serverPath).existsSync(), true);
    expect(File(clientPath).existsSync(), true);

    // Run pub get on helloworld example
    expect(FileUtils.chdir(helloWorldPath), true);
    final pubGet = await TestProcess.start('pub', ['get']);
    await pubGet.shouldExit(0);
    expect(FileUtils.chdir(origPath), true);

    try {
      server = await TestProcess.start('dart', [serverPath]);
      final serverFirstLine = await server.stdout.next;
      expect(serverFirstLine, 'Server listening on port 50051...');

      client = await TestProcess.start('dart', [clientPath]);
      for (final scheme in ['brotli', 'gzip', 'lz4', 'zstd', 'identity']) {
        final clientLine = await client.stdout.next;
        final expectedOutput = 'Greeter client received: Hello, $scheme!';
        expect(clientLine, expectedOutput);
      }
      await client.shouldExit(0);
    } finally {
      await client?.kill();
      await server?.kill();
    }
  });
}
