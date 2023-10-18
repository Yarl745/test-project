part of 'markup_generator_cubit.dart';

abstract class MarkupGeneratorState extends Equatable {
  MarkupGeneratorState({required this.items});

  final List<MarkupItemData> items;

  @override
  List<Object> get props => [items];
}

class MarkupGenerateInitial extends MarkupGeneratorState {
  MarkupGenerateInitial({required super.items});
}

class MarkupItemsUpdate extends MarkupGeneratorState {
  MarkupItemsUpdate({required super.items});

  @override
  List<Object> get props => [items, DateTime.now()];
}
