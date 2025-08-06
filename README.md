<img width="1280" height="640" alt="emergency-buddy-logo" src="https://github.com/user-attachments/assets/01856aa5-eb80-4d0e-8cbb-3f13ae12f79c" />

# Emergency Buddy
Emergency Buddy provides offline-first, privacy-focused emergency information. Packaging the Gemma AI model, knowledge graph, and device information for quick access to emergency services, nearby hospitals, and first aid information.

## Overview
In critical moments, having access to reliable information can make all the difference. But emergencies often happen when we’re least prepared—offline in a remote area, in a country where we don’t speak the language, or when panic makes it hard to think clearly. Many existing tools depend on internet access and come with privacy trade-offs, which can leave people without support when they need it most.

Emergency Buddy is a simple, privacy-conscious mobile app designed to offer help in those difficult moments. It works offline, using a fine-tuned, on-device version of Google’s Gemma 3n to provide essential first aid guidance, point to nearby hospitals, and support multiple languages. It’s not a complete solution to every emergency, but we hope it can be a reliable companion when it matters most.

## Our Mission: Impact-Driven AI
Our vision for Emergency Buddy is to make a meaningful, practical difference in how people navigate emergencies. It addresses a critical gap in preparedness by offering support that works entirely offline—making it especially useful in remote areas or during natural disasters, when communication networks may be unavailable. By handling all data locally, including the analysis of sensitive images for first aid purposes, we prioritise user privacy from the ground up.

This offline, privacy-first design also improves accessibility by removing barriers related to language and connectivity. Our aim is to help anyone feel more equipped to respond in a crisis, with hyper-local, context-aware guidance that could make a life-saving difference before professional help is available.

## Technical Execution: How We Built It
Our primary goal was to develop a robust, offline-first application that is both reliable and straightforward to maintain. To achieve this, we chose a modern tech stack centred around Flutter for cross-platform development, supported by a clean, layered architecture to keep the logic well-organised and scalable.

## Core AI Engine: On-Device Intelligence with Gemma 3n
At the heart of our application is Google’s Gemma 3n, integrated using the flutter_gemma package. Running entirely on-device, it enables our core features:

- **Advanced AI Customization with Unsloth and LoRA**: To adapt Gemma 3n for crisis response, we fine-tuned the base model using Unsloth—chosen for its impressive speed and memory efficiency. By generating LoRA (Low-Rank Adaptation) weights, we were able to train the model on a curated dataset of emergency medical terminology and conversational patterns, without the need to retrain it from scratch. The result is a more accurate, domain-aware AI that offers contextually relevant first aid guidance.
- **Intelligent Function Calling for Location-Aware Responses**: As seen in `lib/data/gemma_chat_datasource.dart`, we leverage Gemma's function calling to intelligently query our offline data sources. The model autonomously decides when to call our custom functions, such as `find_nearby_locations`, which uses the device's GPS. This allows Gemma to generate **dynamic, context-aware responses tailored to the user's real-time geographic location**, such as providing directions to the _nearest_ hospital.
- **Offline Multimodal Analysis**: Users can take a photo of an injury, and our fine-tuned Gemma 3n model provides relevant first aid guidance—particularly helpful when the correct terminology isn’t known. The feature also detects the user’s locale and can translate the response accordingly, making the information more accessible in urgent situations.

## Application Framework and Architecture
We adopted a **Clean Architecture** approach, separating our code into three distinct layers (Presentation, Domain, and Data) to ensure modularity and testability.
- **Flutter Framework**: Chosen for its ability to build a beautiful, high-performance application for Android, iOS, and Web from a single codebase (`lib/presentation/pages/landing_page.dart`).
- **BLoC for State Management**: We use `flutter_bloc` to manage application state predictably. The ChatBloc (`lib/presentation/widgets/chat/bloc/chat_bloc.dart`) handles the entire Gemma model lifecycle, while the `FirstAidCubit` (`lib/presentation/widgets/first_aid/blocs/first_aid_cubit.dart`) manages the UI state for our first-aid listings.
- **Offline Data & Geospatial Search**: All application data is stored locally in JSON files within the `assets/data/` directory. To enable efficient offline searching of nearby hospitals, we implemented a **QuadTree data structure** (`lib/quad_tree/`). This spatial index allows for incredibly fast location-based queries without any network calls, as seen in our `LocationSearchRepo` (`lib/domain/repositories/location_search_repo.dart`).

## Key Issues
- **Offline Accessibility**: First aid information is often inaccessible without an internet connection, making it difficult to find hospital locations and contact details offline.
- **Privacy Concerns**: Privacy concerns prevent sharing sensitive information with third-party apps, limiting the ability to upload personal data or images.
- **Language Barriers**: Language barriers can hinder effective communication during emergencies.

## 🎥 Demo
- **Live Demo:** [Web App Demo](https://emergencybuddy-46275.web.app/)
- **Video Demo:** [Demo Video](https://drive.google.com/file/d/1eBZMQ88EbV7quVKMGXmQxfw9QzYmwKnM/view)


## 🚀 Future Enhancements
While Gemma 3n enables powerful on-device capabilities, there are some important constraints to be aware of:
- **Device variability**: Performance varies significantly across devices. Higher-end phones tend to run the model more reliably, while devices with lower RAM may experience instability or reduced functionality.
- **MediaPipe dependency**: The use of MediaPipe introduces additional complexity and potential volatility, particularly during updates or across different platforms.
- **Large model size**: The model requires a lengthy initial download, which can lead to friction during onboarding. Users may need guidance to understand the value of this setup time.
- **Hardware requirements**: Features such as image analysis and multilingual support work best on devices with more than 8 GB of RAM. On lower-spec devices, these capabilities may be limited or unavailable.

## 🚀 Future Enhancements
- Enable users to upload photos directly within the chat, supporting multimodal input to enhance communication.
- Refine and simplify the user interface for a smoother, more intuitive experience.
- Integrate What3Words to facilitate easy and precise location sharing.

## Hackathon Information
- **Event:** [Google - The Gemma 3n Impact Challenge](https://www.kaggle.com/competitions/google-gemma-3n-hackathon/overview)
- **Theme/Track:** Mobile application, offline first, privacy focused, multilingual emergency buddy
- **Team:** Tiny Big Labs
- **Duration:** 26th June 2025 - 6th August 2025

---

**Built with ❤️ during [Google - The Gemma 3n Impact Challenge](https://www.kaggle.com/competitions/google-gemma-3n-hackathon/overview) 2025**
