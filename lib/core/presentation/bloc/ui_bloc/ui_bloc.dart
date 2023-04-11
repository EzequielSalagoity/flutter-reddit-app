// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {

  UiBloc() : super(const UiState()) {
    on<UiEvent>((event, emit) {
      if(event is ChangeBottomNavbarIndex) {
        emit(state.copyWith(index: event.index, isPostExpanded: false));
      }
      if(event is ChangePostExpandedEvent) {
        emit(state.copyWith(isPostExpanded: event.isOpen));
      }
    });
  }
}