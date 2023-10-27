import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const SelectedTab(index: 0));
  changeTab(int index){
    emit(SelectedTab(index: index));
  }
}
