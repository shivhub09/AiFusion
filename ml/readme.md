# ML_Server

This folder contains the machine learning server for AiFusion. It is responsible for handling various AI functionalities using the Hugging Face library and Flask.

## Overview

The ML_Server is dedicated to running machine learning and AI tasks required by AiFusion. It leverages the Hugging Face library for tasks such as text generation, text summarization, image captioning, and more. The server is built with Flask, providing a seamless integration of AI capabilities into the overall application.

## Features

- **Hugging Face Integration**: Utilizes the Hugging Face library for various AI tasks.
- **Flask Server**: Implements a Flask server to handle machine learning requests.
- **Customizable Models**: Easily swap and integrate different pre-trained models for specific AI tasks.

## Prerequisites

Make sure you have the following installed on your development machine:

- Python (3.x)
- Flask
- Hugging Face Transformers library

## Getting Started

1. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

2. Run the Flask server:

    ```bash
    python app.py
    ```

3. The server should be running at [http://localhost:5000](http://localhost:5000).

## API Endpoints

- `/generate-text`: Endpoint for text generation.
- `/summarize-text`: Endpoint for text summarization.
- `/caption-image`: Endpoint for image captioning.

## Usage

To use the ML server, make HTTP requests to the specified endpoints with the necessary input data. Here's an example using cURL:

```bash
curl -X POST -H "Content-Type: application/json" -d '{"text": "Input text for generation"}' http://localhost:5000/generate-text
