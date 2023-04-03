import 'package:flutter_reddit_app/core/domain/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@GenerateNiceMocks([
  MockSpec<InternetConnectionChecker>(),
]) // flutter pub run build_runner build
import 'network_info_test.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      // arrange
      final tHasConnectionChecker = Future.value(true);

      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionChecker);
      // act
      final result = networkInfo.isConnected;
      // assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnectionChecker);
    });
  });
}
