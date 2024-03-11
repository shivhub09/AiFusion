import tkinter as tk
from tkinter import filedialog
import tensorflow as tf
from tensorflow.keras.preprocessing import image as tf_image
from tensorflow.keras.applications.resnet import ResNet50, preprocess_input, decode_predictions
import requests
from PIL import Image
# Create a simple tkinter window to select an image file
root = tk.Tk()
root.withdraw()

# Ask the user to select an image file
file_path = filedialog.askopenfilename(title="Select an Image File", filetypes=[("Image files", "*.png;*.jpg;*.jpeg")])

# Load the selected image
img = tf_image.load_img(file_path, target_size=(224, 224))
img_array = tf_image.img_to_array(img)
img_array = tf.expand_dims(img_array, 0)
img_array = preprocess_input(img_array)


model = ResNet50(weights='imagenet')

# Continue with the rest of the code for predictions
predictions = model.predict(img_array)
decoded_predictions = decode_predictions(predictions, top=1)[0]
predicted_label = decoded_predictions[0][1]
print(predicted_label)
