import 'package:flutter/material.dart';
import 'package:sidebar/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  _firstScreenState createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  int currentStep = 0;
 

  @override
  void initState() {
    super.initState();
    currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
final localization = AppLocalizations.of(context);
    
    return Center(
      
      child: Container(
          decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12), 
   
  ),
      
        child: Stepper(
          connectorColor:MaterialStateProperty.all(pressedTextColor),
          currentStep: currentStep,
          stepIconBuilder:(stepIndex, stepState) => const Icon(Icons.circle, color: pressedTextColor, size: 15, ),
          steps: [
            Step(
              title: Text(localization!.personalInfo,
              style: const TextStyle(color: textColor),
              ),
              content: Form(
             
                child: Column(
                  
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText:localization.name,
                      labelStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(color: sideBarColor))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return localization.name +" "+localization.required;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: localization.email,  labelStyle: MaterialStateTextStyle.resolveWith((states) => TextStyle(color: sideBarColor))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' البريد الالكتروني مطلوب';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: Text(localization.courseInfo,
              style: const TextStyle(color: textColor)),
              content: Form(
              
                child: Column(
                  children:[
                    TextFormField(
                      decoration: InputDecoration(labelText: localization.name, labelStyle: MaterialStateTextStyle.resolveWith((states) => TextStyle(color: sideBarColor))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'اسم الدورة مطلوب';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: localization.instructor, labelStyle: MaterialStateTextStyle.resolveWith((states) => TextStyle(color: sideBarColor))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' المحاضر مطلوب';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Step(
              title: Text(localization.notes,
              style: const TextStyle(color: textColor)),
              content: Form(
             
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: localization.notes,
                      labelStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(color: sideBarColor))),
                    ),
                  ],
                ),
              ),
            ),
          ],
          controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
       

            return Row(
              children: [
                if (currentStep != 2)
                  TextButton(
                    onPressed: () {
                   
                        controlsDetails.onStepContinue!();
            
                    },
                    child:  Text(localization.next,style: const TextStyle(color: textColor),),
                  ),
                if (currentStep == 2)
                  TextButton(
                    onPressed: () async {
             
                    },
                    child:  Text(localization.save,style: const TextStyle(color: textColor),),
                  ),
                if (currentStep > 0)
                  TextButton(
                    onPressed: controlsDetails.onStepCancel,
                    child:  Text(localization.back,style: const TextStyle(color: textColor),),
                  ),
              ],
            );
          },
          onStepContinue: () {
            if (currentStep < 2) {
          
                setState(() {
                  currentStep += 1;
                });
          
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}
