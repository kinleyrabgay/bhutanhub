# BhutanHub

BhutanHub is an innovative e-commerce platform that allows users to post and discover a wide range of products and services, including new and second-hand goods. This application aims to provide a seamless experience for buying and selling various items such as clothing, electronics, and more.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Comprehensive Product Listings**: Users can browse through a wide variety of categories to find exactly what they need.
- **Service Listings**: Post and discover various services available in the region.
- **Second-Hand Goods**: Buy and sell second-hand items easily.
- **User Profiles**: Each user has a profile where they can manage their listings.
- **Onboarding Experience**: A smooth onboarding process to get users started quickly.
- **Firebase Integration**: Utilizes Firebase for backend services and database management.

## Tech Stack

- **Frontend**: Flutter
- **Backend**: NestJS, Firebase Firestore
- **State Management**: Bloc (Flutter)
- **Authentication**: Firebase Authentication
- **Hosting**: Firebase Hosting

## Installation

### Prerequisites

- Node.js
- pnpm
- Flutter SDK

### Backend Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/kinleyrabgay/bhutanhub-nestjs
    cd bhutanhub-nestjs
    ```

2. Install the dependencies:
    ```bash
    pnpm install
    ```

3. Start the NestJS server:
    ```bash
    npm run start
    ```

### Frontend Setup

1. Navigate to the frontend directory:
    ```bash
    git clone https://github.com/kinleyrabgay/bhutanhub
    cd bhutanhub
    ```

2. Install the dependencies:
    ```bash
    flutter pub get
    ```

3. Run the Flutter app:
    ```bash
    flutter run
    ```

## Usage

### Onboarding

When users first open BhutanHub, they will be guided through an onboarding process that explains the app's features and benefits.

### Browsing Products and Services

Users can browse through various categories on the home page. Each category will display relevant products and services.

### User Profiles

Users can create profiles, manage their listings, and view their purchase history.

## API Endpoints

### User Endpoints

- `BASE: https://bhutanhub.vercel.app/api/v1`
- `POST /users/create`: Create a new user.
- `GET /users/:id`: Get user details.
- `PUT /users/:userId/products/:productId`: Add a product to a user.

### Product Endpoints

- `POST /products/create`: Create a new product.
- `POST /products/list`: Get list of product.
- `GET /products/user/:userId`: Get products by user ID.

## Contributing

We welcome contributions to BhutanHub! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature/your-feature-name
    ```
3. Make your changes.
4. Commit your changes:
    ```bash
    git commit -m "Add your commit message"
    ```
5. Push to the branch:
    ```bash
    git push origin feature/your-feature-name
    ```
6. Create a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any inquiries or feedback, please contact us at support@bhutanhub.com.
