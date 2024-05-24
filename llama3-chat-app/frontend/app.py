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
