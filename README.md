# Fokus App

Fokus is a productivity application designed to help users minimize distractions and stay focused by blocking access to specified websites or apps. The app includes features for managing blocklists, scheduling focus periods, and monitoring system health, all while providing seamless user authentication and a robust logging system for tracking activity and performance.

## What Fokus App Does

- **Distraction Blocking:** Users can block websites or apps during specified time intervals to maintain focus.
- **Custom Schedules:** Define when and for how long blocking rules should apply.
- **User Authentication:** Secure login using email or username with password.
- **Activity Logging:** Tracks user actions, blockList updates, and system performance.
- **System Monitoring:** Periodic health checks ensure backend services are running smoothly.

## Technologies Used

### **Frontend**
- **React Native:** To build a cross-platform mobile application with a user-friendly interface.
- **Swift (iOS):** For native integrations, such as implementing system-level website blocking.

### **Backend**
- **Ruby on Rails:** Provides the core API for user authentication, blockList management, and scheduling.
- **SideKiq:** Handles background jobs for asynchronous tasks like logging and health checks.
- **Node.js:** Manages a logging microservice for real-time log processing and storage.

### **Database**
- **PostgreSQL:** Stores user data, blocklists, and schedules.
- **Loki:** Centralized logging storage for system and activity logs.

### **Logging and Monitoring**
- **Grafana:** Visualizes logs and health metrics via dashboards.
- **Loki:** Efficient log aggregation and querying.

### **Additional Tools**
- **bcrypt:** Secures user passwords.
- **Docker:** Simplifies development and deployment of backend services.

## Key Features

- **Blocklists:** Manage a list of websites or apps to block.
- **Schedules:** Set recurring or custom focus times.
- **Analytics:** Monitor productivity trends and system health.
- **Scalable Design:** Built for extensibility and integration with other services.

Fokus App combines simplicity with powerful tools to empower users to reclaim their focus and enhance productivity.
