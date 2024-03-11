from transformers import pipeline

# Create a summarization pipeline with the TensorFlow model
summarizer = pipeline("summarization")

# Your text
text = """this is the text about how machine learning works and what machine is all about and thus it also tells us about the different types of machine learning that is unsupervised, supervised, and reinforcement learning.
"""

# Perform summarization
result = summarizer(text, max_length=130, min_length=10, do_sample=False)

# Print the result
print(result)
