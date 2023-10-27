part of 'nav_bar_cubit.dart';

sealed class NavBarState extends Equatable {
  const NavBarState();

  @override
  List<Object> get props => [];
}

final class SelectedTab extends NavBarState {
  final int index;

  const SelectedTab({required this.index});
  @override
  List<int> get props => [index];
}
