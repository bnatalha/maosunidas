import 'package:maosunidas/src/commons/mocks.dart';
import 'package:maosunidas/src/commons/models.dart';
import 'package:mobx/mobx.dart';
part 'timeline.controller.g.dart';

class TimelineController = _TimelineControllerBase with _$TimelineController;

abstract class _TimelineControllerBase with Store {
  @observable
  ObservableList<TimelinePost> posts =
      MockTimelinePost.all.map((e) => e).toList().asObservable();
}
