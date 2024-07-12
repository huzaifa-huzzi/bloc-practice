import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart/';


class ImageState extends Equatable {
 final XFile? file ;

  const ImageState({this.file});

  ImageState copyWith({XFile? file}){
    return ImageState(
     file: file ?? this.file
    );

}
  @override
 List<Object?> get props => [file];


}
