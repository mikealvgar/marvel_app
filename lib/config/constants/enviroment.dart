
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String privateKey = dotenv.env['PRIVATE_KEY'] ?? 'No existe la api key';
  static String publicKey = dotenv.env['PUBLIC_KEY'] ?? 'No existe public key';
  static String hash = '1842c11c1f8676bfd18fcf134ea38e5b';
}