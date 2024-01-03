import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zidne/domain_layer/entities/section_entity.dart';

import '../../../core/utilities/service_locator.dart';
import '../../../domain_layer/use_cases/courses/get_sections.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  
  List<SectionEntity> sections = [];

  Future<void> getCourses() async {
    emit(Loading());
    final reqResult = await sl<GetSectionsUseCase>().call();
    reqResult.fold(
      (l) => emit(LoadingFailed(l.message)),
      (r) {
        sections = r;
        emit(LoadingDone());
      },
    );
  }
}
