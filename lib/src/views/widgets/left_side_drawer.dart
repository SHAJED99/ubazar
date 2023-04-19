import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubazar/src/controllers/data_controllers/data_controller.dart';
import 'package:ubazar/src/models/app_models/app_constants.dart';
import 'package:ubazar/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ubazar/src/views/widgets/text_field_widget.dart';

class LeftSideDrawer extends StatelessWidget {
  LeftSideDrawer({super.key});

  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultPadding * 4),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      color: Theme.of(context).primaryColor,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                height: defaultBoxHeight * 2,
                color: Theme.of(context).canvasColor,
                child: const FittedBox(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            // Login
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Obx(
                () => CustomTextFormField(
                  hintText: dataController.token.value.isEmpty ? "Token" : dataController.token.value,
                  maxLines: 5,
                  minLines: 3,
                  height: null,
                  fillColor: Theme.of(context).canvasColor,
                  onFieldSubmitted: (value) async => await dataController.login(value),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Note: Logout will reset all local data and set welcomeScreen show value to false.",
                textAlign: TextAlign.center,
              ),
            ),
            // Logout
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: CustomElevatedButton(
                expanded: true,
                backgroundColor: Theme.of(context).canvasColor,
                onTap: () {
                  dataController.logout();
                  return null;
                },
                child: Text(
                  "Logout",
                  style: buttonText1.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
