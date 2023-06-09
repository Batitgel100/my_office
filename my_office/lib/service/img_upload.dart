import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ImgUploadService {
  Future<String?>? sendImage({XFile? file}) async {
    try {
      String fileName = file!.path.split('/').last;

      FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      Dio dio = Dio();
      Response response = await dio
          .post("http://my_office.mn/mobile/room/tool/image/47", data: data);

      if (response.statusCode == 200) {
        return response.data["url"];
      } else {
        return null;
      }
    } on DioError catch (ex) {
      print(ex.message);
    } catch (Ex) {
      print(Ex.toString());
      throw CustomException(errorMsg: Ex.toString());
    }
    return null;
  }
}

class CustomException implements Exception {
  String? errorMsg;
  int? statusCode;
  CustomException({this.errorMsg, this.statusCode});

  @override
  String toString() {
    return errorMsg!;
  }
}
