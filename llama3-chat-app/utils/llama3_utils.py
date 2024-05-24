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
