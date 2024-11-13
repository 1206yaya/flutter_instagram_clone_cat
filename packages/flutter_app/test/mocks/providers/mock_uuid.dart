import "package:mockito/mockito.dart";
import "package:uuid/data.dart";
import "package:uuid/uuid.dart";

const testingUuid = "12345678-1234-1234-1234-123456789012";

class MockUuid extends Mock implements Uuid {
  MockUuid(this.mockValue);

  final String mockValue;

  @override
  String v4({V4Options? config, Map<String, dynamic>? options}) => mockValue;
}

// class MockUuid extends Mock implements Uuid {
//   @override
//   String v4({V4Options? config, Map<String, dynamic>? options}) {
//     return super.noSuchMethod(
//       Invocation.method(#v4, []),
//       returnValue: "mock-uuid",
//     );
//   }
// }
