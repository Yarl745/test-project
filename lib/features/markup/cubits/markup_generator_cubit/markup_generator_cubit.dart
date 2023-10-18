import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olearistest/features/markup/data/repositories/entities/markup_item_data.dart';
import 'package:olearistest/features/markup/domain/repositories/markup_repository.dart';

part 'markup_generator_state.dart';

class MarkupGeneratorCubit extends Cubit<MarkupGeneratorState> {
  MarkupGeneratorCubit({
    required MarkupRepository markupRepository,
  })  : _markupRepository = markupRepository,
        super(MarkupGenerateInitial(items: []));

  final MarkupRepository _markupRepository;

  void addMarkupItem() async {
    final newIndex = state.items.length;
    emit(MarkupItemsUpdate(
      items: state.items..add(MarkupItemData(index: newIndex)),
    ));
  }

  void removeMarkupItem() async {
    emit(MarkupItemsUpdate(
      items: state.items..removeLast(),
    ));
  }
}
