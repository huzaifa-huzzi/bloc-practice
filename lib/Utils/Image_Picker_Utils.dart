import 'package:image_picker/image_picker.dart';


class ImagePickerUtils {

  final _picker = ImagePicker();

  Future<XFile?>cameraImage() async{
     final XFile? file = await _picker.pickImage(source: ImageSource.camera);
     return file;
}


  Future<XFile?>pickImage() async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }


}