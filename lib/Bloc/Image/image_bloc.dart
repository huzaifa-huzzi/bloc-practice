import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Image/image_event.dart';
import 'package:bloc_practice/Bloc/Image/image_state.dart';

class ImageBloc extends Bloc <ImageEvent,ImageState> {

  ImageBloc():super(const ImageState()){
    on<CameraImage>();
    on<GalleryImage>();

  }

  void _cameraImage(CameraImage event , Emitter<ImageState>states){
    
  }

}