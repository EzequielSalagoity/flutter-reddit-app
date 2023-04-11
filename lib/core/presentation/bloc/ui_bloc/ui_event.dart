part of 'ui_bloc.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavbarIndex extends UiEvent {
  final int index;

  const ChangeBottomNavbarIndex(this.index);
}

class ChangePostExpandedEvent extends UiEvent {
  final bool isOpen;

  const ChangePostExpandedEvent(this.isOpen);
}
