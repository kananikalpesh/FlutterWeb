import 'package:flatten/controllers/my_controller.dart';

import 'package:html_editor_enhanced/html_editor.dart';

class EditorController extends MyController {
  HtmlEditorController htmlEditorController = HtmlEditorController();

  Callbacks getCallbacks() {
    return Callbacks(
      onFocus: () {
        htmlEditorController.setFocus();
      },
      onInit: () {
        htmlEditorController.setFullScreen();
      },
    );
  }
}
