part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}



final class BottomNavBarTapdedEvent extends BottomNavEvent {
//  int tappdedPageNumber = 1;
  int tappdedPageNumber;

  BottomNavBarTapdedEvent({
    required this.tappdedPageNumber,
  });
}