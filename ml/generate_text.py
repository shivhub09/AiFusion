from transformers import pipeline

# Load the summarization pipeline
pipe = pipeline("summarization",model='facebook/bart-base')

text_to_summarize = """This is a long text that you want to summarize. It can contain multiple paragraphs, sentences, and ideas. The purpose of summarization is to condense the text into a shorter version that captures the main points and key information."""

summary = pipe(text_to_summarize)

# Print the generated summary
print()
