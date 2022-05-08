abstract class LogicHandler<T,Params> {
  T usecase;
  LogicHandler(this.usecase);
   call({required Params data});
}