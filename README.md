# Simple Note App

A simple note-taking application built with SwiftUI. This app allows users to set a base API URL, manage notes, and synchronize them with an API.

## Features

- **Set base API URL**: Configure the base URL for the API.
- **Notes list in grid view**: Display notes in a grid view for easy browsing.
- **Pull to refresh**: Refresh the notes list by pulling down.
- **Add notes to the API**: Create new notes and save them to the API.
- **Delete notes from the API**: Remove notes from the API.
- **View details and edit notes**: View detailed information about a note, edit it, and save changes to the API.

## Screenshots


<img src="https://github.com/DeAristyo/Note-App-iOS/assets/84317322/ebe93cd3-093e-462e-b0dd-e4285fb08a1b" width="48">
<img src="[https://github.com/favicon.ico](https://github.com/DeAristyo/Note-App-iOS/assets/84317322/ebe93cd3-093e-462e-b0dd-e4285fb08a1b)" width="48">
<img src="[https://github.com/favicon.ico](https://github.com/DeAristyo/Note-App-iOS/assets/84317322/ebe93cd3-093e-462e-b0dd-e4285fb08a1b)" width="48">
![Landing View](https://github.com/DeAristyo/Note-App-iOS/assets/84317322/ebe93cd3-093e-462e-b0dd-e4285fb08a1b)
![Notes List View](https://github.com/DeAristyo/Note-App-iOS/assets/84317322/f287fb26-06e4-417d-ae8f-8d0dcbe46072)
![Note Details View](https://github.com/DeAristyo/Note-App-iOS/assets/84317322/8802bbe5-2184-4dd7-b508-62e018357fe6)

## Video Screenshot

https://github.com/DeAristyo/Note-App-iOS/assets/84317322/15a571f7-0cd8-40c5-bc98-d8a4a9db6f79


## Requirements

- iOS 15.0+
- Xcode 12.0+
- Swift 5.3+
- CocoaPods

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/simple-note-app.git
    cd simple-note-app
    ```

2. Install the dependencies using CocoaPods:

    ```bash
    pod install
    ```

3. Open the workspace in Xcode:

    ```bash
    open Note-App-iOS.xcworkspace
    ```

4. Build and run the project on your simulator or device.

## Usage

1. **Set Base API URL**:
    - On the first launch, you will be prompted to set the base API URL. Enter the URL of your API and save it.
    - You can also use the default URL `http://localhost:3000`.

2. **Notes List**:
    - Notes are displayed in a grid view.
    - Pull down to refresh the list of notes.

3. **Add Note**:
    - Tap the "Add" button to create a new note.
    - Enter the note details and save it to the API.

4. **Delete Note**:
    - Swipe left on a note in the list to delete it from the API.

5. **View and Edit Note**:
    - Tap on a note to view its details.
    - Edit the note and save changes to the API.

## Acknowledgements

- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
- [Wormholy](https://github.com/pmusolino/Wormholy)
- [Quick](https://github.com/Quick/Quick)
- [Nimble](https://github.com/Quick/Nimble)

---

Feel free to reach out if you have any questions or need further assistance!
