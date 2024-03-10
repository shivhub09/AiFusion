# Backend

This folder contains the backend server for AiFusion. It is built using Node.js and Express to handle user authentication, manage data, and serve as the backend for the Flutter frontend.

## Overview

The backend server is an integral part of AiFusion, responsible for user authentication, data management, and communication with the Flutter frontend. It uses Node.js and Express to provide a robust and scalable backend infrastructure.

## Features

- **User Authentication**: Secure user login and authentication.
- **Data Management**: Handles user data storage and retrieval.
- **RESTful API**: Implements a RESTful API for communication with the Flutter frontend.
- **MongoDB Integration**: Utilizes MongoDB as the primary database.

## Prerequisites

Make sure you have the following installed on your development machine:

- Node.js and npm
- MongoDB

## Getting Started

1. Install dependencies:

    ```bash
    npm install
    ```

2. Set up the MongoDB database.

3. Configure environment variables (if necessary).

4. Run the server:

    ```bash
    node server.js
    ```

5. The server should be running at [http://localhost:3000](http://localhost:3000).

## API Endpoints

- `/api/login`: Endpoint for user login.
- `/api/register`: Endpoint for user registration.
- `/api/user/:id`: Endpoint to retrieve user information.

## Configuration

Adjust the configuration files (`config.js`, `.env`) to match your specific environment and requirements.

## Contribution

Contributions are welcome! Please follow the [contribution guidelines](CONTRIBUTING.md).
