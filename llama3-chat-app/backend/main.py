from fastapi import FastAPI, File, UploadFile
from utils.llama3_utils import generate_response

app = FastAPI()

@app.post("/chat")
async def chat(file: UploadFile = File(...)):
    contents = await file.read()
    context = contents.decode("utf-8")
    response = generate_response(context)
    return {"response": response}
