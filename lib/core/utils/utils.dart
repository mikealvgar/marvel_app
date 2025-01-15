
import 'dart:convert';

import 'package:crypto/crypto.dart';

String generaHash(String timestamp, String privateKey, String publicKey) {
    final input = '$timestamp$privateKey$publicKey';
    final bytes = utf8.encode(input);
    final digest = md5.convert(bytes);
    return digest.toString();
  }