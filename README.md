# SkillNavigator AI 🚀
**An AI-Driven Career Roadmap Generator & Job Matcher**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com)
[![Groq](https://img.shields.io/badge/Groq-Llama_3.1-orange?style=for-the-badge)](https://groq.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

## 📌 Project Overview
SkillNavigator AI is a production-grade application designed to solve the career guidance gap. Using **Generative AI (LLMs)** and **Clean Architecture**, it generates personalized 30-day learning roadmaps based on user experience levels and specific technical fields, specifically optimized for the Pakistani job market.



## ✨ Key Features
* **AI Roadmap Engine:** Generates structured 30-day curriculum JSONs via Llama 3.1.
* **BLoC State Management:** Ensures predictable state transitions and high-performance UI rendering in Flutter.
* **Secure Backend:** FastAPI integration with custom CORS middleware and environment-based secret management.
* **Adaptive UX:** Responsive Material 3 design optimized for Web, Android, and iOS.
* **Localization:** Context-aware resources tailored for developers in Pakistan.

## 🏗 System Architecture
The project follows a decoupled **Client-Server Architecture**:

1.  **Frontend (Flutter):** Utilizes the BLoC (Business Logic Component) pattern to separate UI from business logic.
2.  **Backend (FastAPI):** An asynchronous Python server handling LLM orchestration and data validation.
3.  **AI Layer (Groq):** Powered by the Llama-3.1-8b-instant model for ultra-low latency text generation.

## 🛠 Tech Stack
* **Frontend:** Flutter (Dart), BLoC, Http, Google Fonts.
* **Backend:** Python 3.10+, FastAPI, Uvicorn.
* **AI/ML:** Groq Cloud SDK, Prompt Engineering.
* **DevOps:** Git, Dotenv for secret management, Localtunnel/Ngrok.

## 🚀 Getting Started

### 1. Prerequisites
* Flutter SDK: `^3.x`
* Python: `3.10+`
* Groq API Key

### 2. Backend Setup
```bash
cd skill_navigator_backend
pip install -r requirements.txt
# Create a .env file and add your GROQ_API_KEY
python skillnavigator.py

```

### 3. Frontend Setup

```bash
cd skill_navigator_fronted
flutter pub get
# Update the baseUrl in roadmap_repository.dart with your backend URL
flutter run -d chrome

```

## 🔒 Security & Optimization

* **Push Protection:** API keys are managed via `.env` and excluded from version control via `.gitignore`.
* **CORS Policy:** Strict origin control implemented to allow secure cross-domain requests.
* **Error Handling:** Robust validation for LLM JSON outputs to prevent front-end crashes.

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements.

---

**Developed with ❤️ by [Youmna Saifullah]** *Full-Stack AI & ML Engineer*

```

---
