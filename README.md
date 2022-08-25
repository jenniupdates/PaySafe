
# PaySafe

A new Flutter & Firebase project to create a more inclusive and safer payment journey for the blind and visually-impaired community. Also for Google Solution Challenge 2022

## Description

Our solution aims to assist the lives of those who are visually impaired. One of the key areas that we took into consideration was that given our audience was blind, they will not be able to fully understand the positioning and/or identifying the different buttons to press (and their respective functionalities). Hence, navigation icons are placed in a position that is easy to follow and click (for instance, bottom-right corner for more important functions). Each also performs tasks via different activation ways, some depending on duration of button-pressed, where others rely on double-taps . For easier scalability, we also ensure that most widgets in the application have a text-to-speech function so our audience can always confirm any buttons before committing to the action.

Our main feature lets our audience know what they are “looking” at via the scanning (image-to-text) and text to speech functions. In addition, the integration of payments would allow our audience to access popular online payment options with a visually-impaired extension-help to it. These features would minimise the gap for the blind community to make proper and safe purchases. Finally, the addition of a find-nearby-volunteers feature will act as a safety-net for the visually impaired to seek proper help on areas that our application does not cover.

> Ultimately, this blind-friendly and accessible app helps the visually-impaired community access online payment solutions and make safer transactions.

## Features
- Online Payment services/options (Stripe, etc)

- OCR Scanner and Reader (Image-to-text)

- Find nearby Volunteers

## Attributes
- Text-to-speech features on most important widgets for better navigation
- Optimum widgets' placement

## Important Notes
- We do apologise if you are not able to experiece the product in the most accurate way that we introduced. This is because of tech and knowledge limitations that we hope to achieve given more time, and would continuously improve this app overtime in our best abilities. 
- However, we have enacted out stimulations of this app by using our voice to mimic the app's functionalities during user testing and gaps our current tech do not provide. Thank you.

## Getting Started
> If you expereince any difficulties when running the code or installation, feel free to email us at yinshan.lim.2019@scis.smu.edu.sg for help. We will try our best.
1. Ensure that you have installed visual studio code, otherwise please refer to this link for installation help: https://code.visualstudio.com/
2. You would also need to download Android Studio [here](https://developer.android.com/studio?gclid=CjwKCAjwopWSBhB6EiwAjxmqDTUQLYGh0sJEMbdQvA-U4Agu77LobsgMKDBe9An_Oc-lo_Dm2HRCeBoCkokQAvD_BwE&gclsrc=aw.ds)
3. Now, we need the technologies to run flutter apps.
4. If you are Windows user: please refer to this youtube link as a guide for flutter installation: https://www.youtube.com/watch?v=tun0HUHaDuE
5. Otherwise, if you are a MacOS user, please refer to this youtube guide via this link instead: https://www.youtube.com/watch?v=YVaFoCiQ2SI&t=181s
6. As we worked using Windows Environment, we do apologise if there are any MacOS difficulties. Nevertheless, please email us at: yinshan.lim.2019@scis.smu.edu.sg for help during installations and running the code part.
7. Once you run flutter doctor and all ticks, means you can now run the app.
> <b>Running the App</b>
8. !!!!! Register for a Google Cloud Platform API key and retrieve your API key under credentials.
9. Head into the file: paysafev3/android/app/src/main/**AndroidManifest.xml**, and on line 34, replace the curly braces {API_KEY} with your own GCP API key credential.
12. Open Android Studio, connect an android device to your computer/laptop and run it as emulator.
13. Lastly, open Visual Studio Code and run the main.dart file using: <flutter run --no-sound-null-safety>.
> Your android phone should see the app, named "PaySafev3".

## Thank you.
- Done by: Lim Yin Shan
  
## Going Forward
  
 
## References/Acknowledgements
