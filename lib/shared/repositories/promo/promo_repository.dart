import 'dart:convert';

import '../../../features/beranda/constants/beranda_api_constant.dart';
import '../../../utils/services/Api_service.dart';
import '../../models/promo_model.dart';

class PromoRepository {
    final ApiService _apiService = ApiService();
    final apiConstant = BerandaApiConstant();

    Future<List<PromoModel>> getAllPromo() async {
        try{
            final response = await _apiService.get(apiConstant.getAllPromo);
            if(response.statusCode == 200){
                final List<dynamic> data = await response.data['data'];
                print("Data GetALL REPO PROMO : $data");
                return data.map((json) => PromoModel.fromJson(json)).toList();
            } else {
                print("Error GetALL REPO : ${response.statusMessage}");
                throw Exception('Error fetching menuu: ${response.statusMessage}');
            }
        } catch(e){
            print("Error GetALL REPO : $e");
            throw Exception('Error fetching menu: $e');
    }
    }
}
