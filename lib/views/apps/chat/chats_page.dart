import 'package:flatten/controllers/apps/chat/chats_controller.dart';
import 'package:flatten/helpers/theme/app_style.dart';
import 'package:flatten/helpers/utils/mixins/ui_mixin.dart';
import 'package:flatten/helpers/utils/utils.dart';
import 'package:flatten/helpers/widgets/my_breadcrumb.dart';
import 'package:flatten/helpers/widgets/my_breadcrumb_item.dart';
import 'package:flatten/helpers/widgets/my_container.dart';
import 'package:flatten/helpers/widgets/my_flex.dart';
import 'package:flatten/helpers/widgets/my_flex_item.dart';
import 'package:flatten/helpers/widgets/my_spacing.dart';
import 'package:flatten/helpers/widgets/my_text.dart';
import 'package:flatten/images.dart';
import 'package:flatten/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ChatsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ChatsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Chat",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Apps'),
                        MyBreadcrumbItem(name: 'Chat', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "lg-4 md-12",
                      child: MyContainer.bordered(
                        paddingAll: 0,
                        child: Padding(
                          padding: MySpacing.all(flexSpacing),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  MyContainer.rounded(
                                    height: 40,
                                    width: 40,
                                    paddingAll: 0,
                                    child: Image.asset(
                                      Images.avatars[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  MySpacing.width(16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.labelLarge(
                                          "Den",
                                        ),
                                        MySpacing.height(4),
                                        Row(
                                          children: [
                                            MyContainer.rounded(
                                              height: 10,
                                              width: 10,
                                              color: contentTheme.primary,
                                            ),
                                            MySpacing.width(8),
                                            MyText.bodySmall(
                                              "Online",
                                              muted: true,
                                              fontWeight: 400,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(LucideIcons.settings),
                                ],
                              ),
                              MySpacing.height(22),
                              TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      contentTheme.primary.withOpacity(0.12),
                                  prefixIcon: Icon(
                                    LucideIcons.search,
                                    color: contentTheme.primary,
                                  ),
                                  hintText: "People,groups & messages...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: MySpacing.all(16),
                                ),
                              ),
                              MySpacing.height(22),
                              MyText.titleMedium(
                                "GROUP CHAT",
                                color: contentTheme.title,
                                muted: true,
                                fontWeight: 600,
                              ),
                              MySpacing.height(20),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.circle,
                                    color: contentTheme.success,
                                    size: 16,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    "App Development",
                                  ),
                                ],
                              ),
                              MySpacing.height(8),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.circle,
                                    color: contentTheme.warning,
                                    size: 16,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    "Office WOrk",
                                  ),
                                ],
                              ),
                              MySpacing.height(22),
                              MyText.titleMedium(
                                "CONTACT",
                                color: contentTheme.title,
                                muted: true,
                                fontWeight: 600,
                              ),
                              MySpacing.height(20),
                              SizedBox(
                                height: 400,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: controller.chats.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        MyContainer.rounded(
                                          height: 40,
                                          width: 40,
                                          paddingAll: 0,
                                          child: Image.asset(
                                            Images.avatars[
                                                index % Images.avatars.length],
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        MySpacing.width(16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  MyText.labelLarge(
                                                    "${controller.chats[index].firstName}",
                                                  ),
                                                  MyText.bodySmall(
                                                    '${Utils.getTimeStringFromDateTime(controller.chats[index].sendAt, showSecond: false)}',
                                                    muted: true,
                                                    fontWeight: 600,
                                                  )
                                                ],
                                              ),
                                              MySpacing.height(4),
                                              MyText.bodySmall(
                                                "${controller.chats[index].message}",
                                                muted: true,
                                                fontWeight: 400,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return MySpacing.height(12);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-8",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                MyContainer.rounded(
                                  height: 40,
                                  width: 40,
                                  paddingAll: 0,
                                  child: Image.asset(
                                    Images.avatars[1],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                MySpacing.width(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText.labelLarge(
                                        "Lurette",
                                      ),
                                      MySpacing.height(4),
                                      Row(
                                        children: [
                                          MyContainer.rounded(
                                            height: 10,
                                            width: 10,
                                            color: contentTheme.primary,
                                          ),
                                          MySpacing.width(8),
                                          MyText.bodySmall(
                                            "Online",
                                            fontSize: 12,
                                            muted: true,
                                            fontWeight: 400,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.phone),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.video),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.userPlus),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.trash),
                                ),
                              ],
                            ),
                            Divider(),
                            Column(
                              children: [
                                messages(),
                                MySpacing.height(8),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: MyContainer(
                                    height: 80,
                                    color: contentTheme.primary.withAlpha(30),
                                    padding: MySpacing.x(20),
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller:
                                                controller.messageController,
                                            autocorrect: false,
                                            decoration: InputDecoration(
                                              hintText: "type message here",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(LucideIcons.send),
                                          iconSize: 20.0,
                                          onPressed: () {
                                            controller.sendMessage();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget messages() {
    return Padding(
      padding: MySpacing.xy(16, 16),
      child: SizedBox(
        height: 525,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: controller.chats.length,
          itemBuilder: (BuildContext context, int index) {
            return controller.chats[index].fromMe == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          MyContainer.rounded(
                            height: 32,
                            width: 32,
                            paddingAll: 0,
                            child: Image.asset(
                              Images.avatars[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                          MySpacing.height(4),
                          MyText.bodySmall(
                            '${Utils.getTimeStringFromDateTime(
                              controller.chats[index].sendAt,
                              showSecond: false,
                            )}',
                            muted: true,
                            fontWeight: 600,
                            fontSize: 8,
                          )
                        ],
                      ),
                      MySpacing.width(12),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          MyContainer.none(
                            paddingAll: 8,
                            alignment: Alignment.bottomRight,
                            borderRadiusAll: 8,
                            color: contentTheme.primary.withAlpha(20),
                            child: MyText.titleMedium(
                              controller.chats[index].receiveMessage,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                              color: contentTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          MyContainer.none(
                            paddingAll: 8,
                            alignment: Alignment.bottomLeft,
                            borderRadiusAll: 8,
                            color: contentTheme.primary.withAlpha(20),
                            child: MyText.titleMedium(
                              controller.chats[index].sendMessage,
                              fontSize: 12,
                              color: contentTheme.primary,
                            ),
                          ),
                        ],
                      ),
                      MySpacing.width(12),
                      Column(
                        children: [
                          MyContainer.rounded(
                            height: 32,
                            width: 32,
                            paddingAll: 0,
                            child: Image.asset(
                              Images.avatars[8],
                              fit: BoxFit.cover,
                            ),
                          ),
                          MySpacing.height(4),
                          MyText.bodySmall(
                            '${Utils.getTimeStringFromDateTime(
                              controller.chats[index].sendAt,
                              showSecond: false,
                            )}',
                            fontSize: 8,
                            muted: true,
                            fontWeight: 600,
                          ),
                        ],
                      ),
                    ],
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 12,
            );
          },
        ),
      ),
    );
  }
}
