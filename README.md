# 🐾 Pawfect Guide

> An iOS app for exploring and discovering dog breeds using The Dog API

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2017+-blue.svg)](https://developer.apple.com/xcode/swiftui/)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-lightgrey.svg)](https://www.apple.com/ios/)

---

## 📱 About

Pawfect Guide is a native iOS application that helps users explore dog breeds with photos and detailed information. Built with SwiftUI and modern iOS development practices, the app provides an intuitive interface for discovering your perfect furry companion.

### ✨ Key Features

- **🔍 Search & Discover**: Browse dog breeds with customizable search limits (1-10 results)
- **📸 Beautiful Images**: High-quality photos for each breed via The Dog API
- **ℹ️ Breed Information**: Learn about breed groups, temperaments, and characteristics
- **🎨 Elegant UI**: Custom-designed interface
- **👋 Onboarding Experience**: Interactive first-time user introduction
- **💾 Persistent Settings**: User onboarding with AppStorage

---

## 📝 What I Learned

Building Pawfect Guide helped me master several key iOS development concepts:

- **Modern SwiftUI**: Using `@Observable` macro and environment objects for state management
- **Async/Await**: Implementing modern concurrency patterns for network requests
- **MVVM Architecture**: Proper separation of concerns between UI and business logic
- **API Integration**: Secure API key management and RESTful API consumption
- **Input Validation**: Building robust user input handling with clear error messaging
- **Custom UI Components**: Creating reusable SwiftUI views with consistent design
- **User Experience**: Implementing onboarding flows and state persistence

---

## 🛠️ Technical Stack

### Technologies & Frameworks
- **Language**: Swift 5.9+
- **UI Framework**: SwiftUI
- **Architecture**: MVVM (Model-View-ViewModel)
- **Concurrency**: Swift Async/Await
- **Data Persistence**: AppStorage for user onboarding
- **Networking**: URLSession with async/await

### Design Patterns
- **Observable Pattern**: Using `@Observable` macro for reactive state management
- **Environment Objects**: Shared state across views
- **Async Image Loading**: Built-in AsyncImage for efficient image handling
- **Input Validation**: Robust error handling for user input

---

## 🏗️ Architecture

### MVVM Structure

```
Pawfect Guide/
├── Models/
│   └── BreedModel.swift          # Observable ViewModel managing app state
├── Services/
│   └── DataService.swift         # API integration and networking layer
├── Views/
│   ├── HomeView.swift            # Main search and list interface
│   ├── ListView.swift            # Individual breed card component
│   └── OnboardingView.swift      # First-time user experience
└── PawfectGuide.swift            # App entry point with AppStorage
```

### Key Components

#### **BreedModel (ViewModel)**
- Manages application state using `@Observable`
- Coordinates data fetching through DataService
- Provides reactive updates to views

#### **DataService**
- Handles all API communications
- Implements async/await for network requests
- Secure API key management via Bundle configuration
- Error handling and response parsing

#### **HomeView**
- Dynamic search interface with input validation
- Loading states and error messaging
- Conditional rendering based on app state
- Custom search bar with numeric validation (1-10 range)

#### **ListView**
- Reusable breed card component
- AsyncImage for efficient image loading
- Gradient overlays for text readability
- Responsive layout with breed information display

---

## 🎨 Features Deep Dive

### Search Functionality
- **Input Validation**: Ensures user enters numbers between 1-10
- **Error Handling**: Clear error messages for invalid inputs
- **Loading States**: Visual feedback during API requests
- **Empty States**: Helpful prompts when no search has been performed

### Visual Design
- **Custom Color Palette**: Warm, dog-friendly colors (oranges, creams, browns)
- **Gradient Backgrounds**: Subtle overlays for visual interest
- **Shadow Effects**: Depth and elevation for card components
- **Typography**: Carefully chosen fonts and weights for hierarchy

### User Experience
- **Onboarding Flow**: Interactive introduction on first launch
- **Skip Option**: Allows experienced users to bypass onboarding
- **Persistent Preferences**: AppStorage remembers onboarding completion

---

## 🔌 API Integration

### The Dog API
This app integrates with [The Dog API](https://thedogapi.com/) to fetch breed information and images.

**Endpoints Used:**
- `GET /v1/images/search?limit={limit}&has_breeds=1`
  - Retrieves random dog images with breed data
  - Requires API key authentication
  - Returns breed name, group, temperament, and image URL

**API Key Configuration:**
```swift
// Securely stored in Info.plist
let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
```

**Security Note**: API keys are stored in `Info.plist` and excluded from version control via `.gitignore`

---

## 📦 Installation & Setup

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0+ deployment target
- The Dog API key (free at [thedogapi.com](https://thedogapi.com/))

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/wahyukw/PawfectGuide.git
   cd PawfectGuide
   ```

2. **Add your API key**
   - Open `Info.plist`
   - Add a new key: `API_KEY`
   - Set the value to your Dog API key
   
   Or add this to `Info.plist`:
   ```xml
   <key>API_KEY</key>
   <string>YOUR_API_KEY_HERE</string>
   ```

3. **Open in Xcode**
   ```bash
   open Pawfect\ Guide.xcodeproj
   ```

4. **Build and Run**
   - Select your target device/simulator
   - Press `Cmd + R` to build and run

---

## 🧪 Code Highlights

### Async/Await Networking
```swift
func breedSearch(limit: Int) async -> [BreedSearch] {
    guard let url = URL(string: endpointUrl) else { return [] }
    
    var request = URLRequest(url: url)
    request.addValue(apiKey ?? "", forHTTPHeaderField: "x-api-key")
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode([BreedSearch].self, from: data)
    } catch {
        print(error)
        return []
    }
}
```

### Observable ViewModel Pattern
```swift
@Observable
class BreedModel: NSObject {
    var breedSearch = [BreedSearch]()
    
    func getBreeds(limit: Int) {
        Task {
            breedSearch = await dataService.breedSearch(limit: limit)
        }
    }
}
```

### Input Validation with Error Handling
```swift
Button("Go") {
    guard let limit = Int(query) else {
        errorMessage = "Please enter a valid number"
        return
    }
    guard limit >= 1 && limit <= 10 else {
        errorMessage = "Please enter a number from 1-10"
        return
    }
    model.getBreeds(limit: limit)
}
```

---

## 📸 Screenshots

*Coming soon - Screenshots will be added once the app is fully polished*


---

## 🤝 Contributing

This is a personal learning project, but feedback and suggestions are welcome! Feel free to:

- Open an issue for bugs or feature requests
- Submit pull requests for improvements
- Share your thoughts on the code architecture

---

## 📄 License

This project is created for educational purposes. The Dog API is used under their terms of service.

---

## 👨‍💻 Author

**Wahyu Kwan**
- GitHub: [@wahyukw](https://github.com/wahyukw)
- LinkedIn: [wahyukwan](https://www.linkedin.com/in/wahyukwan/)
- Email: wahyukwan@gmail.com

---

## 🙏 Acknowledgments

- [The Dog API](https://thedogapi.com/) for providing the breed data and images
- Apple's SwiftUI documentation and WWDC sessions
- The iOS development community for best practices and inspiration

---

<div align="center">

**Made with ❤️ and SwiftUI**

⭐ Star this repo if you find it helpful!

</div>
