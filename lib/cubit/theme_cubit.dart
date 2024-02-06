import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<String> {
  ThemeCubit() : super('green');

  void updateTheme(String theme) {
    emit(theme);
  }

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['theme'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return <String, String>{'theme': state.toString()};
  }
}
