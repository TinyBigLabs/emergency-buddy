# Emergency Buddy

* Enabling a mobile, offline first, privacy focused emergency buddy application powered by Gemma *
* Offering hospital and first aid info while being offline using Gemma 3n's  capabilities.*

## 🏆 Hackathon Information
- **Event:** [Google - The Gemma 3n Impact Challenge](https://www.kaggle.com/competitions/google-gemma-3n-hackathon/overview)
- **Theme/Track:** [Mobile application, offline first, privacy focused, Multilingual Emergency Buddy]
- **Team:** [Tiny Big Labs]
- **Duration:** [26th June 2025 - 6th August 2024]

## 📋 Table of Contents
- [Emergency Buddy](#emergency-buddy)
  - [🏆 Hackathon Information](#-hackathon-information)
  - [📋 Table of Contents](#-table-of-contents)
  - [🎯 Overview](#-overview)
  - [🚨 Problem Statement](#-problem-statement)
    - [Key Issues](#key-issues)
  - [💡 Solution](#-solution)
  - [✨ Features](#-features)
  - [🛠 Tech Stack](#-tech-stack)
    - [Frontend](#frontend)
    - [Backend](#backend)
    - [Database](#database)
    - [APIs \& Services](#apis--services)
    - [Development Tools](#development-tools)
  - [🏗 Architecture](#-architecture)
  - [🚀 Installation \& Setup](#-installation--setup)
    - [Prerequisites](#prerequisites)
    - [Local Development Setup](#local-development-setup)
  - [📱 Usage](#-usage)
  - [🎥 Demo](#-demo)
  - [💪 Challenges](#-challenges)
  - [🎉 Accomplishments](#-accomplishments)
  - [📚 What We Learned](#-what-we-learned)
  - [🚀 Future Enhancements](#-future-enhancements)
  - [👥 Team](#-team)
  - [🤝 Contributing](#-contributing)
  - [📄 License](#-license)
  - [🙏 Acknowledgments](#-acknowledgments)

## 🎯 Overview
This is a mobile, offline app first - using gemma's unique capabilities to provide AI help on small devices no matter where you are.
It is designed to be a personal emergency buddy that provides critical information and first aid assistance in emergency situations, even when offline or when language is a barrier.

## 🚨 Problem Statement
Emergencies are not only happening when you are online or have lots of people around you who you can ask. 
In situations where you need immediate access to emergency information, such as hospital locations, first aid instructions, or emergency contacts, but have no means to connect with anyone.
Or when you are in a remote area with no internet access, or when you are in a foreign country where language barriers make it difficult to communicate effectively.
### Key Issues
- First aid information is often inaccessible without an internet connection.
- Hospital locations and contact details are not readily available offline.
- Privacy concerns prevent sharing sensitive information with third-party apps, like uploading personal data or images
- Language barriers can hinder effective communication during emergencies.
- In case of getting stung or eating berries that may be poisonous there is no

## 💡 Solution
Explain your approach:
- Create an single-page app that works fully offline and is easy to navigate
- Using Gemma as a conversation partner to answer questions and analyse images
- Nearest safe places offer some direction even when offline.
- Utilising Gemma's knowledge of first aid, environmental disasters, plants analysis, animal knowledge to provide flexible, situation relevant information

## ✨ Features
The main Gemma features used in this app:
- 🔑 **Core Feature 1:** Hospital locator with offline maps
- 🚀 **Core Feature 2:** First aid - image analysis, real chat.
- 📊 **Core Feature 3:** Country specific emergency numbers and contacts
- 📊 **Core Feature 4:** Translation capabilities for emergency phrases
- 🎨 **Additional Feature:** First Aid leaflets and general information on what to do in case of an emergency

## 🛠 Tech Stack
### Frontend
- [Flutter] - [FLutter is a cross-platform framework that allows us to build a single codebase for both iOS,Android and Web, ensuring a consistent user experience across devices.]

### Backend
- [Technology] - [Brief reason for choice]
- [Technology] - [Brief reason for choice]

### Database
- [Technology] - [Brief reason for choice]

### APIs & Services
- [Service/API] - [Purpose]
- [Service/API] - [Purpose]

### Development Tools
- [Tool] - [Purpose]
- [Tool] - [Purpose]

## 🏗 Architecture
Include a system architecture diagram or describe the high-level architecture:
```
[User Interface] → [API Gateway] → [Backend Services] → [Database]
                                ↓
                            [External APIs]
```

## 🚀 Installation & Setup

### Prerequisites
- [Requirement 1] (version X.X or higher)
- [Requirement 2]
- [API keys or accounts needed]

### Local Development Setup
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/project-name.git
   cd project-name
   ```

2. **Install dependencies**
   ```bash
   # Frontend
   cd frontend
   npm install
   
   # Backend
   cd ../backend
   pip install -r requirements.txt
   ```

3. **Environment Configuration**
   ```bash
   # Copy environment template
   cp .env.example .env
   
   # Add your API keys and configuration
   nano .env
   ```

4. **Database Setup**
   ```bash
   # Run migrations
   python manage.py migrate
   ```

5. **Start the application**
   ```bash
   # Start backend
   python manage.py runserver
   
   # Start frontend (in another terminal)
   cd frontend
   npm start
   ```

## 📱 Usage
Provide clear instructions on how to use your application:

1. **Getting Started**
    - Step 1: [Action]
    - Step 2: [Action]
    - Step 3: [Action]

2. **Key Workflows**
    - **Workflow 1:** Detailed steps
    - **Workflow 2:** Detailed steps

## 🎥 Demo
- **Live Demo:** [https://your-demo-url.com](https://your-demo-url.com)
- **Video Demo:** [https://youtube.com/watch?v=demo-video](https://youtube.com/watch?v=demo-video)
- **Screenshots:**

![Screenshot 1](./images/screenshot1.png)
*Caption describing the screenshot*

![Screenshot 2](./images/screenshot2.png)
*Caption describing the screenshot*

## 💪 Challenges
Discuss the main challenges you faced:
- **Challenge 1:** Description and how you overcame it
- **Challenge 2:** Description and how you overcame it
- **Technical Hurdles:** Any specific technical difficulties

## 🎉 Accomplishments
Highlight what you're proud of:
- Successfully implemented [specific feature] in [time constraint]
- Achieved [achievements]
- Learned and integrated [achievements]
- Created a user-friendly interface despite time constraints

## 📚 What We Learned
Share key learnings from the hackathon:
- Technical skills acquired: Gemma, LLM fine tuning, Knowledge Graph, Quadtree, MediaPipe, Unsloth, Codelab,
- Tools or frameworks you tried for the first time: Gemma with Media Pipe and Tools/KnowlegeGraph, Lora-weights, Unsloth, Codelab, 
- Project management insights: Too many ideas coming in and there are lots of Opportunities with Gemma, only just scratched the surface what can be done with it. It still takes a quite long time to download Gemma, this needs to be communicated to teh app user in a new way.
- Teamwork lessons

## 🚀 Future Enhancements
Outline your roadmap for future development:
- **Short-term (1-2 weeks):**
    - [ ] Feature enhancement 1
    - [ ] Bug fix 1
    - [ ] Performance optimization

- **Medium-term (1-3 months):**
    - [ ] Major feature addition
    - [ ] Mobile app development
    - [ ] Advanced analytics

- **Long-term (3+ months):**
    - [ ] Platform scaling
    - [ ] Enterprise features
    - [ ] International expansion

## 👥 Team
Meet the team behind this project:

| Name | Role | GitHub | LinkedIn |
|------|------|--------|----------|
| [Name 1] | Full-Stack Developer | [@github](https://github.com/username) | [LinkedIn](https://linkedin.com/in/username) |
| [Name 2] | Frontend Developer | [@github](https://github.com/username) | [LinkedIn](https://linkedin.com/in/username) |
| [Name 3] | Backend Developer | [@github](https://github.com/username) | [LinkedIn](https://linkedin.com/in/username) |
| [Name 4] | UI/UX Designer | [@github](https://github.com/username) | [LinkedIn](https://linkedin.com/in/username) |

## 🤝 Contributing
We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments
- [Hackathon organizers]
- [Mentors who helped]
- [APIs or services used]
- [Inspiration sources]
- [Special thanks]

---

**Built with ❤️ during [Google - The Gemma 3n Impact Challenge](https://www.kaggle.com/competitions/google-gemma-3n-hackathon/overview) 2025**