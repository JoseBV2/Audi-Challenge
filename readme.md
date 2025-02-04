# 🐱 Cat Explorer - iOS Take-Home Assignment

## 📌 Description
Cat Explorer is an iOS application that allows users to explore different cat breeds, view details, and manage a list of favorites. It features an attractive UI, pagination, persistence, and smooth animations.

## 📲 Features
- 🐾 **Browse cat breeds** with images and descriptions.
- ⭐ **Add and remove favorites**, with persistence using `UserDefaults`.
- 🔄 **Efficient pagination** for optimized performance.
- 🎨 **Smooth animations and an attractive UI** using `SwiftUI` and `Kingfisher`.
- 🌐 **Networking with `Alamofire`**, ensuring efficient communication with the API.
- 🛑 **Error handling**, with messages and retry options for network failures.
- ✅ **Unit and UI Testing** to validate functionality and user experience.

## 🏗 Architecture
The app follows the **MVVM (Model-View-ViewModel)** pattern, separating responsibilities and maintaining modular code.

### **Project Structure**
```
📂 HomeAssignment_Audi
 ├── 📂 Models            # Data models
 ├── 📂 ViewModels        # Business logic (MVVM)
 ├── 📂 Views             # SwiftUI views
 ├── 📂 Services          # Networking module (Alamofire)
 ├── 📂 Resources         # Assets and configuration files
 ├── 📂 Tests             # Unit and UI tests
 ├── 📄 APIEndpoint.swift # API endpoint definitions
 ├── 📄 NetworkService.swift # Network client
 ├── 📄 README.md         # Project documentation
```

## ⚙️ Installation
1. Clone the repository on your local machine:
   ```sh
   git clone https://github.com/your_username/cat-explorer.git
   ```
2. Open `HomeAssignment_Audi.xcodeproj` in Xcode.
3. Ensure all dependencies are installed via **Swift Package Manager (SPM)**:
   - Go to **File** → **Add Packages...**
   - Search for **Alamofire** and **Kingfisher**, and add them to the project.
4. Build and run the project on a simulator or device.

## 🔬 Testing
### **Unit Tests**
- `CatListViewModelTests.swift`: Verifies the logic for loading cats and favorites.
- `NetworkServiceTests.swift`: Ensures network calls work correctly.

### **UI Tests**
- `CatExplorerUITests.swift`: Validates navigation and main app flows.

Run tests:
```sh
Cmd + U in Xcode
```

## 📡 API Used
- [The Cat API](https://thecatapi.com/)

## 👨‍💻 Technologies
- Swift 5
- SwiftUI
- Combine
- Alamofire
- Kingfisher
- XCTest for unit and UI testing

## 🏁 Contributions
Contributions are welcome! If you find a bug or want to improve the app, open a `pull request` or create an `issue`.

---
**Developed by:** José Bustamante 🚀

