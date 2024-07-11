
import 'package:equatable/equatable.dart';


class SwitchState extends Equatable {
 final  bool isSwitch;

  const SwitchState({this.isSwitch =false});

  SwitchState copyWith({bool? isSwitch}){
     return SwitchState(
       isSwitch: isSwitch ?? this.isSwitch
     );
  }

  @override
   List<Object> get props => [isSwitch];



}
