// import 'package:asspa/core/event/event_hanling.dart';
// import 'package:asspa/core/error/failuers.dart';
// import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
// class FetchUserListBloc
//     extends LogicHandler<FetchUserListUseCase, FetchUserListModle> {
//   FetchUserListUseCase usecase;
//
//   FetchUserListBloc(this.usecase) : super(usecase);
//
//   @override
//   call({required FetchUserListModle data}) {
//     // TODO: implement call
//     return FetchUserListEvents(usecase, data);
//   }
//
// }
//
// class FetchUserListEvents extends EventMutations<FetchUserListModle> {
//   FetchUserListUseCase usecase;
//
//   FetchUserListEvents(this.usecase, FetchUserListModle data) : super(data);
//
//   @override
//   perform() async {
//     final request = await usecase(data: data);
//     request.fold((l) => throw ServerFailure(), (r) => result = r);
//   }
// }