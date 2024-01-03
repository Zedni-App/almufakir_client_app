import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int activeTab = 0;
  void changeActiveTab(int newIndex) {
    activeTab = newIndex;
    emit(ActiveTabChanged());
  }
}
