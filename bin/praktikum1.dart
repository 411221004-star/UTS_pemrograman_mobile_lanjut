import 'dart:io';

void main(List<String> arguments) {
  final test = arguments.isNotEmpty ? arguments.first : 'test2';

  if (test == 'test1') {
    print('Test1');
  } else if (test == 'test2') {
    print('Test2');
  } else {
    print('Something else');
  }

  if (test == 'test2') {
    print('Test2 again');
  }

  final stringTest = 'true';
  if (stringTest == 'true') {
    print('Kebenaran');
  }

  print('\nUsage: dart run bin/dart_application_1.dart [test1|test2|anything]');
}
