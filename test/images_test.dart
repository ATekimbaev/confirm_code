import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:token/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.star8).existsSync(), isTrue);
  });
}
