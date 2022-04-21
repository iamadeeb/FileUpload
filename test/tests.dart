import 'package:flutter_test/flutter_test.dart';
import 'package:upload_files/view_model/view_controller.dart';

void main() {
  group('Tests', () {
    ViewController viewController = ViewController();
    test('Select a file', () async {
      /// In order to test, please select a file once the window pop up
      await viewController.onSelectPressed();
      expect(viewController.currentSelectedFile != null, true);
    });

    test('Testing cancel button beside upload button', () {
      viewController.onCancelPressed();
      expect(viewController.percent != 0, false);
    });
  });
}
