import 'package:venturo_java_code/features/voucher/constants/voucher_api_constant.dart';
import 'package:venturo_java_code/features/voucher/models/voucher_model.dart';
import 'package:venturo_java_code/utils/services/Api_service.dart';
    class VoucherRepository {
      VoucherRepository._();

      var apiConstant = VoucherApiConstant();
      final ApiService _apiService = ApiService();
  
      Future<List<VoucherModel>> getAllVoucher () async {
      try {
final respone = await _apiService.get(apiConstant.getAllVoucher);

        if(respone.statusCode == 200){
          final data = respone.data['data'];
          return data.map((json) => VoucherModel.fromJson(data)).toList();
        } else {
        print("error fetching menu GetID ( REPO ) : ${respone.statusMessage}");
        throw Exception(
            "Error fetching menu GetID ( REPO ) : ${respone.statusMessage}");
      }

    } catch(e){
      print("Error In Voucher (REPO) $e");
      throw Exception("Error In Voucher (REPO) $e");
    }
              }

    Future<VoucherModel> getVoucherByID(int idVoucher) async {
      try {
      final respone = await _apiService.get(apiConstant.getVoucherByID + "/$idVoucher");

        if(respone.statusCode == 200){
          final data = respone.data['data'];
          return data;
        } else {
        print("error fetching menu GetID ( REPO ) : ${respone.statusMessage}");
        throw Exception(
            "Error fetching menu GetID ( REPO ) : ${respone.statusMessage}");
      }

    } catch(e){
      print("Error In Voucher (REPO) $e");
      throw Exception("Error In Voucher (REPO) $e");
    }
    }  
    }
    
