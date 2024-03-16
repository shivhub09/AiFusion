import io
from flask import Flask, jsonify, request
from transformers import ViTImageProcessor, ViTForImageClassification, pipeline
from PIL import Image
import base64

app = Flask(__name__)

processor = ViTImageProcessor.from_pretrained('google/vit-base-patch16-224')
model = ViTForImageClassification.from_pretrained('google/vit-base-patch16-224')

# for text
pipe = pipeline("summarization",model='facebook/bart-base')


@app.route('/')
def index():
  return "Flask server is running"

@app.route('/summarizeText', methods=['POST'])
def summarizeText():
  data = request.get_json()
  input_text = data['text']
  summary = pipe(input_text)

  if(summary):
    return jsonify({"success":True , "summarized_text":summary[0]})

# not working
@app.route('/classifyImage', methods=["POST"])  
def classify():
  data = request.get_json()
  try:
    base64_image = data['image']
    decoded_img = base64.b64decode(base64_image)

    img = Image.open(io.BytesIO(decoded_img))

    inputs = processor(images=img, return_tensors="pt")
    outputs = model(**inputs)
    logits = outputs.logits
    predicted_class_idx = logits.argmax(-1).item()
    return jsonify({"success": True, "classification_label": model.config.id2label[predicted_class_idx]}), 200

  except (ValueError, IOError) as e: 
    return jsonify({'error': 'Invalid image format'}), 400
  except Exception as e:  
    return jsonify({'error': str(e)}), 400



if __name__ == '__main__':
  app.run(debug=True)  
