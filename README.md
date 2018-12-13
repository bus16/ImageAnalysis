# Cloud Vision demo
Demo application which use Google Vision API for detect labels on Images

## Prerequisites
- An API key for the Cloud Vision API (See [how-to] to learn more)
- An OSX machine or emulator
- [Xcode 10][xcode]

## Quickstart
- Clone this repo and `cd` into the `ImageAnalysis` directory.
- In `Constants.swift`, replace `YOUR_KEY` with the API key obtained above.
- Open the project
- Build and run the app.

## Running the app

- As with all Google Cloud APIs, every call to the Vision API must be associated
with a project within the [Google Cloud Console][cloud-console] that has the
Vision API enabled. This is described in more detail in the [getting started
doc][getting-started], but in brief:
- Create a project (or use an existing one) in the [Cloud
Console][cloud-console]
- [Enable billing][billing] and the [Vision API][enable-vision].
- Create an [API key][api-key], and save this for later.

- Clone this `cloud-vision` repository on GitHub. If you have [`git`][git] installed, you can do this by executing the following command:

$ git clone https://github.com/bus16/ImageAnalysis.git

This will download the repository of samples into the directory `ImageAnalysis`.

Otherwise, GitHub offers an [auto-generated zip file][vision-zip] of the `master` branch, which you can download and extract.

- Run this project in Xcode.

- In Xcode's Project Navigator, open the `Constants.swift` file within the `Resources` directory.

- Find the line where the `YOUR_KEY` is set. Replace the string value with the API key obtained from the Cloud console above. This key is the credential used in the `request` method to authenticate all requests to the Vision API. Calls to the API are thus associated with the project you created above, for access and billing purposes.

- You are now ready to build and run the project. In Xcode you can do this by clicking the 'Play' button in the top left. This will launch the app on the simulator or on the device you've selected.

- Tap the `Tap to choose Image` label. This calls the `loadImage` action to load the device's photo library.

- Select an image from your device. If you're using the simulator, you can drag and drop an image from your computer into the simulator using Finder.
- This executes the `imagePickerController`, which saves the selected image and calls the `base64EncodeImage` function. This function base64 encodes the image and resizes it if it's too large to send to the API.
- The `sendImageData` method creates and executes a label detection request to the Cloud Vision API.
- When the API responds, the `parse` function is called. This method constructs a string of the labels returned from the API. It then displays the label results in the UI by populating the `LABELS` and `SCORE` `UITableView` with the data returned from the API.

[how-to]: https://cloud.google.com/vision/docs/how-to
[vision-zip]: https://github.com/GoogleCloudPlatform/cloud-vision/archive/master.zip
[getting-started]: https://cloud.google.com/vision/docs/getting-started
[cloud-console]: https://console.cloud.google.com
[git]: https://git-scm.com/
[xcode]: https://developer.apple.com/xcode/
[billing]: https://console.cloud.google.com/billing?project=_
[enable-vision]: https://console.cloud.google.com/apis/api/vision.googleapis.com/overview?project=_
[api-key]: https://console.cloud.google.com/apis/credentials?project=_
