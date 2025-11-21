# 🍎 Apple-Aligned Swift & SwiftUI Study Plan (Weeks 1–12)

This file contains the complete 12‑week, Apple‑aligned Swift and SwiftUI curriculum, integrating the latest Develop in Swift, SwiftUI Tutorials, SwiftData, Concurrency, and modern app architecture guidance. Designed for repo use and scalable long-term learning.

---

# Week 1 — Swift Essentials + SwiftUI Basics
**Apple Curriculum:** Develop in Swift — Units 1 & 2  
**SwiftUI Tutorial:** Creating and Combining Views

### You’ll Learn
- Variables & constants  
- Data types  
- Functions  
- SwiftUI basics (views, modifiers, layout)  
- Running and previewing apps  
- Reusable components

### Mini‑Project
Build your first SwiftUI screen with text, images, and a button.

### Deliverables
- Simple layout using VStack / HStack  
- Reusable Card view  
- notes/week1-basics.md

---

# Week 2 — State, Data Flow, and Lists
**Apple Curriculum:** Unit 3  
**SwiftUI Tutorial:** Building Lists and Navigation

### You’ll Learn
- @State and bindings  
- Passing data between views  
- Lists & ForEach  
- Basic navigation  
- Struct data models

### Mini‑Project
Create a dynamic list with a detail view.

### Deliverables
- Models/Item.swift  
- NavigationStack with detail screen

---

# Week 3 — Handling Input + Intro to MVVM
**Apple Curriculum:** Unit 4  
**SwiftUI Tutorial:** Handling User Input

### You’ll Learn
- TextField, Toggle, Slider  
- Form inputs  
- ObservableObject + @Published  
- When and why MVVM matters  
- Basic ViewModel structure

### Mini‑Project
Convert a simple logic feature into a ViewModel.

### Deliverables
- ViewModels/FeatureViewModel.swift  
- Views bound to the VM

---

# Week 4 — Persistence, AppStorage, and Architecture
**Apple Curriculum:** Unit 5  
**Apple Modern Guidance:** AppStorage, project organization

### You’ll Learn
- UserDefaults + AppStorage  
- Saving basic persistent data  
- Model → ViewModel → View  
- File and folder organization  
- Preparing for SwiftData

### Mini‑Project
Persistence for “Favorites” using @AppStorage.

### Deliverables
- AppStorage integration  
- Architecture folder re‑org  
- Notes on MVVM separation

---

# Week 5 — Drawing, Animation, and SwiftData Intro
**Apple Curriculum:** Unit 6  
**SwiftUI Tutorial:** Drawing & Animation  
**Modern Addition:** SwiftData intro (2023+)

### You’ll Learn
- Custom shapes  
- Implicit & explicit animations  
- SwiftData basics  
- When to use SwiftData vs AppStorage

### Mini‑Project
Animate a control or build a simple SwiftData model.

### Deliverables
- Shapes folder  
- Animated UI  
- Simple @Model data

---

# Week 6 — Testing, Accessibility, Polish & Deployment
**Apple Curriculum:** Unit 7

### You’ll Learn
- SwiftUI Preview testing  
- Unit testing  
- Accessibility labels & VoiceOver  
- App icon + launch screen  
- Running on a physical device  
- Archive export

### Mini‑Project
Finalize your app for device deployment.

### Deliverables
- Accessibility audit  
- App icon  
- Final build archive

---

# Week 7 — Concurrency (async/await)
**Apple Curriculum:** App Dev with Swift (Unit 2)

### You’ll Learn
- async / await  
- Structured concurrency (Task, TaskGroup)  
- Updating SwiftUI views with async data  
- Error handling

### Mini‑Project
Fetch remote data using async/await.

### Deliverables
- NetworkService.swift  
- ViewModel calling async functions

---

# Week 8 — Networking & JSON Decoding
**Apple Curriculum:** App Dev with Swift (Unit 3)

### You’ll Learn
- URLSession with async/await  
- JSON parsing (Codable)  
- Handling network errors  
- Loading remote images

### Mini‑Project
“Daily Quote from API” feature.

### Deliverables
- Codable models  
- API → VM → View pipeline

---

# Week 9 — SwiftData Deep Dive
**Apple Curriculum:** SwiftData (2023+)

### You’ll Learn
- Defining @Model types  
- SwiftData containers  
- CRUD operations  
- Using @Query  
- Data model relationships

### Mini‑Project
Saved quotes, tasks, or items using SwiftData.

### Deliverables
- SwiftData model  
- CRUD UI  
- Persistent data screen

---

# Week 10 — Widgets & Live Activities
**Apple Curriculum:** WidgetKit (modern edition)

### You’ll Learn
- WidgetKit architecture  
- Timeline entries  
- Widget configuration  
- Live Activity basics  
- Integrating SwiftData with widgets

### Mini‑Project
"Motivation of the Day" widget.

### Deliverables
- Widget target  
- TimelineProvider implementation  
- Widget preview

---

# Week 11 — Monetization + Store Prep
**Apple Curriculum:** App Store Connect + App Business Essentials

### You’ll Learn
- In‑App Purchases (overview)  
- Subscription groups  
- Privacy policy requirements  
- Metadata creation  
- TestFlight distribution

### Mini‑Project
Mock App Store listing.

### Deliverables
- Metadata draft  
- Screenshot set  
- Privacy placeholder

---

# Week 12 — Architecture Mastery (MVVM, Services, Protocols)
**Apple Curriculum:** Advanced App Architecture

### You’ll Learn
- Splitting logic into services  
- Dependency injection  
- Protocol-based testing  
- Scalable MVVM patterns  
- Apple’s recommended patterns

### Mini‑Project
Refactor a project (Daily Motivation or TallyShift) into clean MVVM.

### Deliverables
- Services/NetworkService.swift  
- Services/PersistenceService.swift  
- Dependency-injected ViewModels

---

# End of Curriculum
This 12‑week roadmap aligns fully with Apple’s modern SwiftUI + SwiftData + MVVM curriculum and is ready for direct repo upload.
