import 'package:dio/dio.dart';

import '../../../utils/constants/api_keys.dart';
import '../../dio/client_dio.dart';
import '../../models/remote/response/product_response.dart';

class FavoriteService {
  final Dio _dio = ClientDio.instance.dio;

  Future<void> addToFavorites(int productId) async {
    const endpoint = ApiKeys.favoriteCreate;

    try {
      final response = await _dio.post(
        endpoint,
        data: {"product": productId},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("API Xətası: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Favoritə əlavə edilərkən xəta baş verdi");
    }
  }

  Future<void> removeFromFavorites(int productId) async {
    final endpoint = "${ApiKeys.favorite}$productId/";

    try {
      final response = await _dio.delete(endpoint);

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception("API Xətası: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Favoritlərdən silinərkən xəta baş verdi");
    }
  }

  Future<List<Result>> getFavorites() async {
    const endpoint = ApiKeys.favorite;

    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((item) => Result.fromJson(item))
            .toList();
      } else {
        throw Exception("Favoritləri gətirərkən xəta baş verdi");
      }
    } catch (e) {
      throw Exception("Xəta baş verdi");
    }
  }
}
