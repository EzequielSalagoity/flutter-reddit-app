part of 'ui_bloc.dart';

class UiState extends Equatable {
  final int index;
  final bool isPostExpanded;
  
  const UiState({
    this.index = 0,
    this.isPostExpanded = false,
  });

  UiState copyWith({
    int? index,
     bool? isPostExpanded
  }) {
    return UiState(
      index: index ?? this.index,
      isPostExpanded: isPostExpanded ?? this.isPostExpanded,
    );
  }
  
  @override
  List<Object> get props => [index, isPostExpanded];
}