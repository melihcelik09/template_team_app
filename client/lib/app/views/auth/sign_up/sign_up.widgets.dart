import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/routes/routes_widgets.dart';
import 'package:client/app/views/auth/sign_in/sign_in.viewmodel.dart';
import 'package:client/app/widgets/buttons/widgets/button_color.dart';
import 'package:client/app/widgets/buttons/widgets/button_size.dart';
import 'package:client/app/widgets/buttons/widgets/custom_elevated_button.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/custom_text_form_field.dart';
import 'package:client/app/widgets/inputs/widgets/text_fields/keyboard_type.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWidgets {
  Widget signUpTextField(BuildContext context) {
    final provider = Provider.of<SignInViewModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormal,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.fullName,
              hintText: "John Doe",
            ),
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.email,
              keyboardType: KeyboardType.email,
              hintText: "john@example.com",
            ),
            CustomTextFormField(
              labelTextValue: L10n.of(context)!.password,
              hintText: L10n.of(context)!.setPassword,
            ),
            SizedBox(
              width: context.dynamicWidth(1),
              child: CustomElevatedButton(
                onPressed: () async {
                  if (await provider.permissionGetCache()) {
                    NavigationService.instance
                        .navigateToPageClear(path: Routes.navigation.name);
                  } else {
                    NavigationService.instance
                        .navigateToPageClear(path: Routes.permission.name);
                    await provider.permissionSetCache(true);
                  }
                },
                text: L10n.of(context)!.signup,
                buttonSize: ButtonSize.large,
                buttonColor: ButtonColor.purple,
                textColor: ButtonColor.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
