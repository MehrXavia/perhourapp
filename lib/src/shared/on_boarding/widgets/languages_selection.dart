import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../main_index.dart';
import '../../settings/presentation/bloc/locale_cubit.dart';
import '../../settings/presentation/bloc/locale_state.dart';

class LanguagesSelection extends BaseStatelessWidget {
  LanguagesSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocalState>(
      bloc: LocaleCubit()..getLanguageData(),
      builder: (context, state) {
        return SelectionButtonChip(
          initialId: state.language,
          types: [
            ChipItem(title: strings.arabic, id: context.ar),
            ChipItem(title: strings.english, id: context.en),
            // ChipItem(title: strings.indian, id: context.hi),
          ],
          onSelected: (ChipItem item) {
            context.read<LocaleCubit>().setLanguageData(item.id ?? context.ar);
          },
        );
      },
    );
  }
}
