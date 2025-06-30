import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/page/project_card_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/home_controller.dart';
import '../data/projects_data.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: 'My Portfolio'.text.white.bold.make(),
        backgroundColor: Colors.blue,
        actions:
            isMobile
                ? [
                  Obx(
                    () => IconButton(
                      icon: Icon(
                        controller.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: controller.toggleTheme,
                    ),
                  ),
                ]
                : [
                  'About'.text.white
                      .make()
                      .onTap(() => controller.scrollToSection('about'))
                      .p16(),
                  'Projects'.text.white
                      .make()
                      .onTap(() => controller.scrollToSection('projects'))
                      .p16(),
                  'Contact'.text.white
                      .make()
                      .onTap(() => controller.scrollToSection('contact'))
                      .p16(),
                  Obx(
                    () => IconButton(
                      icon: Icon(
                        controller.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: controller.toggleTheme,
                    ),
                  ),
                ],
      ),
      drawer:
          isMobile
              ? Drawer(
                child: VStack([
                  DrawerHeader(
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: 'Menu'.text.white.xl3.make(),
                  ).w(context.screenWidth),
                  ListTile(
                    title: 'About'.text.make(),
                    onTap: () {
                      controller.scrollToSection('about');
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: 'Projects'.text.make(),
                    onTap: () {
                      controller.scrollToSection('projects');
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: 'Contact'.text.make(),
                    onTap: () {
                      controller.scrollToSection('contact');
                      Get.back();
                    },
                  ),
                ]),
              )
              : null,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: VStack([
          // About Section
          VStack([
            CircleAvatar(
              radius: isMobile ? 50 : 100,
              backgroundImage: const AssetImage(
                'assets/image/IMG_20240217_135346.jpg',
              ),
            ).centered(),
            20.heightBox,
            'Nasir khan'.text.xl4.textStyle(GoogleFonts.merriweather()).bold.make(),
            'Flutter Developer'.text.xl.gray500.textStyle(GoogleFonts.notoSansMono()).make(),
            20.heightBox,
            controller.aboutMe.text.textStyle(GoogleFonts.libreBaskerville()).lg.center.make().p16(),
            20.heightBox,
            HStack([
              IconButton(
                icon: const Icon(FontAwesomeIcons.github),
                onPressed:
                    () => controller.launchURL('https://github.com/nrkhan-223'),
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed:
                    () => controller.launchURL(
                      'https://www.linkedin.com/in/nasir-khan-94452521a/',
                    ),
              ),
            ]).centered(),
          ]).p(40),
          // Projects Section
          VStack([
                'Projects'.text.xl3.textStyle(GoogleFonts.notoSansMono()).black.bold.make(),
                20.heightBox,
                isMobile
                    ? VStack(
                      alignment: MainAxisAlignment.center,
                      crossAlignment: CrossAxisAlignment.center,
                      projects
                          .map(
                            (project) => ProjectCard(
                              title: project.title,
                              description: project.description,
                              url: project.url,
                            ),
                          )
                          .toList(),
                    )
                    : GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      children:
                          projects
                              .map(
                                (project) => ProjectCard(
                                  title: project.title,
                                  description: project.description,
                                  url: project.url,
                                ),
                              )
                              .toList(),
                    ),
              ])
              .pSymmetric(h: 20, v: 10)
              .box
              .alignCenter
              .width(context.screenWidth)
              .color(controller.isDarkMode.value ? Vx.gray900 : Vx.gray200)
              .make(),
          // Contact Section
          VStack([
            'Contact'.text.xl3.bold.make(),
            20.heightBox,
            'Feel free to reach out to me via email or social media!'
                .text
                .center
                .make()
                .p16(),
            20.heightBox,
            isMobile
                ? VStack([
                  ElevatedButton(
                    onPressed:
                        () => controller.launchURL(
                          'mailto:redoykhan8141@gmail.com',
                        ),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.envelope, size: 16).px8(),
                      'Send Email'.text.make(),
                    ]),
                  ).p8(),
                  ElevatedButton(
                    onPressed: () => controller.makePhoneCall('+8801641634899'),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.phone, size: 16).px8(),
                      'Call Me'.text.make(),
                    ]),
                  ).p8(),
                  ElevatedButton(
                    onPressed:
                        () => controller.sendWhatsAppMessage(
                          '+8801641634899',
                          'Hello, I’m contacting you regarding your portfolio.',
                        ),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.whatsapp, size: 16).px8(),
                      'Message on WhatsApp'.text.make(),
                    ]),
                  ).p8(),
                ])
                : HStack([
                  ElevatedButton(
                    onPressed:
                        () => controller.launchURL(
                          'mailto:redoykhan8141@gmail.com',
                        ),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.envelope, size: 16).px8(),
                      'Send Email'.text.make(),
                    ]),
                  ).p8(),
                  ElevatedButton(
                    onPressed: () => controller.makePhoneCall('+8801641634899'),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.phone, size: 16).px8(),
                      'Call Me'.text.make(),
                    ]),
                  ).p8(),
                  ElevatedButton(
                    onPressed:
                        () => controller.sendWhatsAppMessage(
                          '+8801641634899',
                          'Hello, I’m contacting you regarding your portfolio.',
                        ),
                    child: HStack([
                      FaIcon(FontAwesomeIcons.whatsapp, size: 16).px8(),
                      'Message on WhatsApp'.text.make(),
                    ]),
                  ).p8(),
                ]).centered(),
          ]).p(40),
        ]),
      ),
    );
  }
}
