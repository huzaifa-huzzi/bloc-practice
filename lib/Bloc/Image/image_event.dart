import 'package:equatable/equatable.dart';


abstract class ImageEvent extends Equatable {
 const  ImageEvent();

 @override
 List<Object> get props => [];
}

class CameraImage extends ImageEvent{}
class GalleryImage extends ImageEvent{}
