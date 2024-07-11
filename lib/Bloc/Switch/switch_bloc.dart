import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Switch/switch_event.dart';
import 'package:bloc_practice/Bloc/Switch/switch_state.dart';



class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
     on<EnableOrDisableNotifications>(_enableorDisableNotifications);
  }

  void _enableorDisableNotifications(EnableOrDisableNotifications events,Emitter<SwitchState>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
