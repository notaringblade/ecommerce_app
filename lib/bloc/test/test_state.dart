part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
  
  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoaded extends TestState {}

class TestError extends TestState {}
