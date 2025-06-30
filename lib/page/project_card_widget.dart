import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/home_controller.dart';

class ProjectCard extends GetView<HomeController> {
  final String title;
  final String description;
  final String url;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child:
          VStack([
            title.text.xl2.bold.make(),
            10.heightBox,
            description.text.maxLines(5).textStyle(GoogleFonts.cairo()).lg.ellipsis.make(),
            10.heightBox,
            Spacer(),
            HStack([
              'Check his on play store'.text.semiBold.xl.green400.make(),10.widthBox,
              Icon(FontAwesomeIcons.googlePlay,size: 20, color: Vx.green400),
            ]).onTap(() => controller.launchURL(url)),
          ]).box.padding(EdgeInsets.symmetric(horizontal: 10,vertical: 15)).height(200).make(),
    );
  }
}
