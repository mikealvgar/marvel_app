import 'package:get/get.dart';
import 'package:marvel_app/config/constants/enviroment.dart';

import '../utils/utils.dart';

class ApiMarvel extends GetConnect{

  // Método base para llamar a la api de Marvel agregando query params por default
  Future<Map<String, dynamic>> getMethod(String endpoint, { int? limit, int? offset}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final publicKey = Enviroment.publicKey; 
    final privateKey = Enviroment.privateKey;

    final hash = generaHash(timestamp, privateKey, publicKey);

    Map<String, dynamic> params = {
      'apikey': publicKey,
      'ts': timestamp,
      'hash': hash,
      'offset': '$offset',
      'limit': '$limit'
    };

    try {
      final response = await get('http://gateway.marvel.com/v1/public/$endpoint', query: params);
      return response.body;
    } catch (e) {
      throw Exception('Error al cargar la información: $e');
    }
  }
}
