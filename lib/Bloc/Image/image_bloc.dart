import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Image/image_event.dart';
import 'package:bloc_practice/Bloc/Image/image_state.dart';
import 'package:bloc_practice/Utils/Image_Picker_Utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc extends Bloc <ImageEvent,ImageState> {

  final ImagePickerUtils imagePickerUtils;

  ImageBloc( this.imagePickerUtils):super(const ImageState()){
    on<CameraImage>(_cameraImage);

  }

  void _cameraImage(CameraImage event , Emitter<ImageState>states) async{
     XFile? file = await imagePickerUtils.cameraImage();
     emit(state.copyWith(file: file));
  }

}