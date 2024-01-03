import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';

import '../../shared_components/custom_error_widget.dart';
import '../cubit/sections_cubit.dart';
import 'section_view.dart';

class SliverSectionsGrid extends StatelessWidget {
  const SliverSectionsGrid({
    this.maxElement,
    super.key,
  });
  final int? maxElement;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionsCubit, SectionsState>(
      buildWhen: (p, c) =>
          c is Loading || c is LoadingDone || c is LoadingFailed,
      builder: (context, state) {
        final cubit = context.read<SectionsCubit>();
        if (cubit.sections.isNotEmpty) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: _getCount(cubit),
              itemBuilder: (_, index) {
                return SectionView(cubit.sections[index]);
              },
            ),
          );
        }
        if (state is LoadingFailed) {
          return SliverFillRemaining(
            child: CustomErrorWidget(
              primaryMessage: state.error,
              retryFun: () => cubit.getCourses(),
            ),
          );
        }

        cubit.getCourses();
        return const SliverFillRemaining(child: NewtonLoadingIndicator());
      },
    );
  }

  int _getCount(SectionsCubit cubit) {
    if (maxElement == null || maxElement! > cubit.sections.length) {
      return cubit.sections.length;
    }

    return maxElement!;
  }
}
