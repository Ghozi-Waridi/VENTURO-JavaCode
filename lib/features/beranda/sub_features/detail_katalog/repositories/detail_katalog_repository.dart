import 'package:venturo_java_code/features/beranda/constants/beranda_api_constant.dart';
import 'package:venturo_java_code/features/beranda/sub_features/detail_katalog/models/menu_detial_model.dart';
import 'package:venturo_java_code/utils/services/Api_service.dart';

class DetailKatalogRepository {
  final ApiService _apiService = ApiService();
  var apiConstant = BerandaApiConstant();

  Future <MenuDetailModel>getAllMenu(int id) async {
    try {
      final response = await _apiService.get(apiConstant.getMenuByID + "/$id");
      // print("response Detail Panjang Level : ${response}");
      print("URL : ${apiConstant.getMenuByID + "/$id"}");
      if (response.statusCode == 200) {
        final  data = response.data['data'];
        print("data Detail Panjang Level : ${data}");
        return MenuDetailModel.fromJson(data);
      } else  {
        print("error fetching menu GetID ( REPO ) : ${response.statusMessage}");
        throw Exception(
            "Error fetching menu GetID ( REPO ) : ${response.statusMessage}");
      }
    } catch (e) {
      print("Error in MenuRepository || GetID ( REPO ) : ${e}");
      throw Exception("Error in MenuRepository || GetID ( REPO ) : ${e}");
    }
  }
}
