part of 'publish_cubit.dart';

@immutable
abstract class PublishState {}

class PublishInitial extends PublishState {}

class AssetsLoaded extends PublishState {}
