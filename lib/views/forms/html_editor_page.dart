import 'package:flatten/controllers/forms/html_editor_controller.dart';
import 'package:flatten/helpers/theme/app_style.dart';
import 'package:flatten/helpers/utils/mixins/ui_mixin.dart';
import 'package:flatten/helpers/widgets/my_breadcrumb.dart';
import 'package:flatten/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flatten/helpers/widgets/my_container.dart';
import 'package:flatten/helpers/widgets/my_spacing.dart';
import 'package:flatten/helpers/widgets/my_text.dart';
import 'package:flatten/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HtmlEditorPage extends StatefulWidget {
  const HtmlEditorPage({Key? key}) : super(key: key);

  @override
  State<HtmlEditorPage> createState() => _HtmlEditorPageState();
}

class _HtmlEditorPageState extends State<HtmlEditorPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late EditorController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(EditorController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "HTML Editor",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Forms"),
                        MyBreadcrumbItem(name: "HTML Editor", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer.bordered(
                  child: HtmlEditor(
                    callbacks: controller.getCallbacks(),
                    controller: controller.htmlEditorController,
                    htmlEditorOptions: HtmlEditorOptions(
                      adjustHeightForKeyboard: true,
                      hint: 'Your text here...',
                      shouldEnsureVisible: true,
                      // darkMode: ThemeCustomizer.instance.theme==ThemeMode.dark
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                      toolbarPosition: ToolbarPosition.aboveEditor,
                      toolbarType: ToolbarType.nativeScrollable,
                      dropdownBackgroundColor: contentTheme.background,
                      dropdownBoxDecoration: BoxDecoration(
                        color: contentTheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
