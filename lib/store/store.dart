import 'package:werewolfmoderator/store/state/app.state.dart';
import 'package:redux/redux.dart';
import 'package:werewolfmoderator/store/reducers/reducer.dart';

Future<Store<AppState>> createStore() async {
  return Store(rootReducer, initialState: AppState());
}
