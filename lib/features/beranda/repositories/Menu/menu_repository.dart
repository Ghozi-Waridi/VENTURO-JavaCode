import 'package:venturo_java_code/features/beranda/constants/beranda_api_constant.dart';
import 'package:venturo_java_code/utils/services/api_service.dart';
import '../../models/menu_model.dart';

class MenuRepository {
  final ApiService _apiService = ApiService();
  final BerandaApiConstant apiConstant = BerandaApiConstant();

  Future<List<MenuModel>> getAllMenu() async {
    print("REPOSITORY");
    try {
      final response = await _apiService.get(apiConstant.getAllMenu);
      print("Data Response Repo : $response");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        print("Data Menu Repo : $data");
        print("Data pertama : ${data[0]}");
        print(data.runtimeType);
        return data.map((e) => MenuModel.fromJson(e)).toList();
      } else {
        print(('Error fetching menu REPO : ${response.statusMessage}'));
        throw Exception('Error fetching menu: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error in MenuRepository REPO : $e');
      throw Exception('Error in MenuRepository: $e');
    }
  }

  Future<List<MenuModel>> getMenuByCategory(String category) async {
    print("Nama Kategorinya adalah : $category");
      try{
late final response; 
        if(category != "all"){
         response = await _apiService.get(apiConstant.getMenuCategory + "$category");
        }
        
      print("Path ${apiConstant.getMenuCategory + "$category"}");
        if(response.statusCode == 200){
            final List<dynamic> data = response.data['data'];
            print(data[0]);
            return data.map((json) => MenuModel.fromJson(json)).toList();
        } else {
          print("Error fetching menu ( REPO ) : ${response.statusMessage}");
          throw Exception("Error fetching menu ( REPO )");
        }
    } catch(e){
        print("Error in MenuRepository || GET ( REPO ) : $e");
        throw Exception("Error in MenuRepository || getMenuCategory ( REPO )");
    }
  }

  Future<List<MenuModel>> getDetialByID (int idMenu) async {
      try{
          final response = await _apiService.get(apiConstant.getMenuByID + "/$idMenu");
          if(response.statusCode == 200){
              final data = await response.data['data'];
              
              return data;
          } else {
              print("error fetching menu GetID ( REPO ) : ${response.statusMessage}");
              throw Exception("Error fetching menu GetID ( REPO ) : ${response.statusMessage}");
          }
      }catch(e){
          print("Error in MenuRepository || GetID ( REPO ) : ${e}");
          throw Exception("Error in MenuRepository || GetID ( REPO ) : ${e}");
      }
  }

  

  Future<void> deleteItem(int idMenu) async {
    try {
      final response = await _apiService.post('/menu/delete', data: {
        'id_menu': idMenu,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to delete menu: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error deleting menu: $e');
    }
  }
}
