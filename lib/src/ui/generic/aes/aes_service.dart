import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class AESService {
  AESService() {
    _aesKey = Key.fromUtf8(
      _decryptionKey,
    );
    _encrypter = Encrypter(
      AES(
        _aesKey,
        mode: AESMode.cbc,
      ),
    );
  }

  late Key _aesKey;
  final String _decryptionKey = '4D92199149E0F2EF009B4160F3182E11';
  late Encrypter _encrypter;

  final IV _iv = IV.allZerosOfLength(16);

  String encrypt({
    required String input,
  }) {
    final Encrypted encrypted = _encrypter.encrypt(
      input,
      iv: _iv,
    );
    return base64.encode(
      encrypted.bytes,
    );
  }

  String decrypt({
    required String encryptedString,
  }) {
    final String decrypted = _encrypter.decrypt64(
      encryptedString,
      iv: _iv,
    );
    return decrypted;
  }
}
