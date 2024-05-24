#!/bin/bash

# Create the project directory
mkdir llama3-chat-app
cd llama3-chat-app

# Create the backend directory and files
mkdir backend
touch backend/__init__.py
touch backend/main.py

# Create the frontend directory and files
mkdir frontend
touch frontend/__init__.py
touch frontend/app.py

# Create the utils directory and files
mkdir utils
touch utils/__init__.py
touch utils/llama3_utils.py

# Create the requirements.txt file
touch requirements.txt

# Add the required dependencies to requirements.txt
echo "fastapi" >> requirements.txt
echo "gradio" >> requirements.txt
echo "transformers" >> requirements.txt
echo "torch" >> requirements.txt

# Add code to backend/main.py
cat << EOF > backend/main.py
from fastapi import FastAPI, File, UploadFile
from utils.llama3_utils import generate_response

app = FastAPI()

@app.post("/chat")
async def chat(file: UploadFile = File(...)):
    contents = await file.read()
    context = contents.decode("utf-8")
    response = generate_response(context)
    return {"response": response}
EOF

# Add code to utils/llama3_utils.py
cat << EOF > utils/llama3_utils.py
from transformers import LLamaForCausalLM, LLamaTokenizer

# Load the LLaMA model and tokenizer
model = LLamaForCausalLM.from_pretrained("decapoda-research/llama-3b-hf")
tokenizer = LLamaTokenizer.from_pretrained("decapoda-research/llama-3b-hf")

def generate_response(context):
    # Tokenize the input context
    input_ids = tokenizer.encode(context, return_tensors="pt")

    # Generate the response
    output = model.generate(input_ids, max_length=1024, do_sample=True, top_k=50, top_p=0.95, num_return_sequences=1)

    # Decode the response
    response = tokenizer.decode(output[0], skip_special_tokens=True)

    return response
EOF

# Add code to frontend/app.py
cat << EOF > frontend/app.py
import gradio as gr
from fastapi import UploadFile

def chat(file):
    # Send the file to the backend for processing
    response = requests.post("http://localhost:8000/chat", files={"file": file})
    return response.json()["response"]

# Create the Gradio interface
iface = gr.Interface(
    fn=chat,
    inputs=gr.File(label="Upload a text file"),
    outputs="text",
    title="LLaMA Chat",
    description="Chat with LLaMA using a text file as context",
)

# Launch the Gradio app
iface.launch()
EOF

echo "Folder structure and files created successfully!"