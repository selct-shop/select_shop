part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
// sealed class HomeEvent extends Equatable {
}
 final class BottomNavBarTapdedEvent extends HomeEvent { 

//  int tappdedPageNumber = 1;
 int tappdedPageNumber ;

BottomNavBarTapdedEvent({
  required this.tappdedPageNumber,
});

  }
