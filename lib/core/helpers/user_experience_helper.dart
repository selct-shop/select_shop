// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/view/Shared/app_button.dart';

class UserExperinceHelper {
// final BuildContext theContext;
// String? theDilogTitle, theDilogContent, confirmDilogText, cancelDilogText ;
// void Function()? onConfirmDilogFunction, onCancelDilogFunction;
// final

  // UserXperinceHelper({  });
  showCustomDialog({
    required BuildContext theContext,
    String? dialogTitle,
    String? dialogContent,
    String? confirmButtonTitle,
    String? cancelButtonTitle,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
// showCustomDialog({  required this.theContext })

    // data: ThemeData(canvasColor: Colors.orange),

    return showDialog<String>(
      context: theContext,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        // surfaceTintColor: null,

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
                width: 20,
              ),
              //  dialogContent != null ? Text(dialogTitle!) : null,
              dialogTitle != null
                  ? Text(
                      dialogTitle,
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16,
                        height: .8,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(
                height: 20,
                width: 20,
              ),
              dialogContent != null
                  ? Text(
                      dialogContent,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey2Color,

                        fontSize: 12,
                        // height: .8,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(),

              const SizedBox(
                height: 20,
                width: 20,
              ),

              // ElevatedButton (

              //   // onPressed: () => Navigator.pop(context, 'OK'),
              //   style: ButtonStyle(
              //     backgroundColor:
              //         MaterialStateProperty.all(AppColors.mainColor),

              //   // shape: MaterialStateProperty( MaterialStateOutlinedBorder())

              //   ),

              //   onPressed: onConfirm,

              //   child: confirmButtonTitle != null
              //       ? Text(confirmButtonTitle)
              //       : const SizedBox(),
              // ),

              AppButton(
                title: confirmButtonTitle ?? '',
                borderRadius: 10,
                hasBorder: true,
                borderColor: AppColors.mainColor,
                backgroundColor: AppColors.mainColor,
                textColor: Colors.white,
              ),

              const SizedBox(
                height: 10,
                width: 10,
              ),
              // TextButton(
              //   // onPressed: () => Navigator.pop(context, 'Cancel'),
              //   onPressed: onCancel,
              //   child: cancelButtonTitle != null
              //       ? Text(cancelButtonTitle)
              //       : const SizedBox(),
              // ),

              AppButton(
                title: cancelButtonTitle ?? '',
                borderRadius: 10,
                hasBorder: true,
                borderColor: AppColors.mainColor,
                backgroundColor: Colors.white,
                textColor: AppColors.mainColor,
              ),

              //
              //

              const SizedBox(
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),

        // title: dialogContent != null ? Text(dialogTitle!) : null,
        // content: dialogContent != null ? Text(dialogContent) : null,
        // actions: <Widget>[
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       TextButton(
        //         // onPressed: () => Navigator.pop(context, 'OK'),
        //         onPressed: onConfirm,
        //         child: confirmButtonTitle != null
        //             ? Text(confirmButtonTitle)
        //             : const SizedBox(),
        //       ),
        //       TextButton(
        //         // onPressed: () => Navigator.pop(context, 'Cancel'),
        //         onPressed: onCancel,
        //         child: cancelButtonTitle != null
        //             ? Text(cancelButtonTitle)
        //             : const SizedBox(),
        //       ),
        //     ],
        //   )
        // ],
      ),
      // builder: (BuildContext context) {
      //   return Container(
      //     // height:  ,
      //     width: 220,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Column(
      //       children: [
      //         TextButton(
      //           // onPressed: () => Navigator.pop(context, 'OK'),
      //           onPressed: onConfirm,
      //           child: confirmButtonTitle != null
      //               ? Text(confirmButtonTitle)
      //               : const SizedBox(),
      //         ),
      //         TextButton(
      //           // onPressed: () => Navigator.pop(context, 'Cancel'),
      //           onPressed: onCancel,
      //           child: cancelButtonTitle != null
      //               ? Text(cancelButtonTitle)
      //               : const SizedBox(),
      //         ),
      //       ],
      //     ),
      //   );
      // }
      //
    );
  }
}





// AlertDialog(
//           alignment: Alignment.center,
//           backgroundColor: Colors.white,
//           surfaceTintColor: Colors.transparent,
//           // surfaceTintColor: null,

//           title: dialogContent != null ? Text(dialogTitle!) : null,
//           content: dialogContent != null ? Text(dialogContent) : null,
//           actions: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextButton(
//                   // onPressed: () => Navigator.pop(context, 'OK'),
//                   onPressed: onConfirm,
//                   child: confirmButtonTitle != null
//                       ? Text(confirmButtonTitle)
//                       : const SizedBox(),
//                 ),
//                 TextButton(
//                   // onPressed: () => Navigator.pop(context, 'Cancel'),
//                   onPressed: onCancel,
//                   child: cancelButtonTitle != null
//                       ? Text(cancelButtonTitle)
//                       : const SizedBox(),
//                 ),
//               ],
//             )
//           ],
//         ),