# TalktoDoc

This is a chat-style web application that interacts and produces responses using the llama3 model locally. The application is built using FastAPI for the backend, Gradio for the user interface, and the Hugging Face Transformers library for loading and running the llama3 model.

## Features

- Upload text files to be used as context for the chat conversation
- Generate responses based on the uploaded context using the llama3 model
- Gradio UI for a user-friendly chat interface
- FastAPI backend for handling file uploads and generating responses

## Requirements

- Python 3.7 or higher
- CPU or GPU (GPU recommended for better performance with large language models)

## Installation

1. Clone the repository:

git clone https://github.com/your-username/llama3-chat-app.git

2. Navigate to the project directory:


cd llama3-chat-app

3. Install the required dependencies:


pip install -r requirements.txt

4. Download the llama3 model and tokenizer files, and place them in the appropriate directory (e.g., `models/`).

## Usage

1. Start the FastAPI backend:


uvicorn backend.main:app --reload

2. In a separate terminal, start the Gradio frontend:


python frontend/app.py

3. Open your web browser and navigate to the URL provided by Gradio (e.g., `http://localhost:7860`).

4. Upload a text file to be used as the context for the chat conversation.

5. Type your message in the chat input field and press Enter to receive a response from the llama3 model based on the provided context.

## Folder Structure

llama3-chat-app/
├── backend/
│ ├── init.py
│ └── main.py
├── frontend/
│ ├── init.py
│ └── app.py
├── utils/
│ ├── init.py
│ └── llama3_utils.py
├── models/
│ └── ... (place your llama3 model and tokenizer files here)
├── requirements.txt
└── README.md
