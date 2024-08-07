part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

// --- Fetch Products ---
class FetchProductEvent extends HomeEvent {
  const FetchProductEvent({
    required this.key,
    required this.subKey,
  });

  final String key;
  final String subKey;

  @override
  List<Object?> get props => [key];
}
