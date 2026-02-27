cat << EOF > request.json
{
    "contents": [
        {
            "role": "user",
            "parts": [
                {
                    "text": "This is my first message."
                }
            ]
        },
        {
            "role": "model",
            "parts": [
                {
                    "text": "**Greeting and Acknowledging**\n\nI've processed the user's initial message, recognizing it as an opening statement. My focus is now on crafting a fitting response – a welcoming greeting that acknowledges their initiation while offering assistance.\n\n\n\n**Crafting the Salutation**\n\nI've moved on to the core of the response: the greeting itself. I'm focusing on crafting a welcoming and engaging opening. I'm weighing different tones – simple, enthusiastic, or descriptive – to find the best fit for this initial interaction. The key is to be both helpful and encourage further interaction, while remaining professional."
                },
                {
                    "text": "Hello! It’s nice to meet you.\n\nHow can I help you today? Whether you have a specific question, need help with a task like writing or coding, or just want to\n chat, feel free to let me know!"
                }
            ]
        },
        {
            "role": "user",
            "parts": [
                {
                    "text": "INSERT_INPUT_HERE"
                }
            ]
        }
    ]
    , "systemInstruction": {
        "parts": [
        {
            "text": "These are test system intructions."
        }
      ]
    }
    , "generationConfig": {
        "temperature": 0
        ,"maxOutputTokens": 65535
        ,"stopSequences": ["\"\"\""]
        ,"topP": 0.99
        ,"thinkingConfig": {
            "thinkingLevel": "HIGH"
        }
    },
    "safetySettings": [
        {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "OFF"
        }
    ]
    , "tools": [
      {
        "googleSearch": {}
      }
    ]
}
EOF

API_KEY="<YOUR_API_KEY>"
API_ENDPOINT="aiplatform.googleapis.com"
MODEL_ID="gemini-3-pro-preview"
GENERATE_CONTENT_API="streamGenerateContent"

curl \
-X POST \
-H "Content-Type: application/json" \
"https://${API_ENDPOINT}/v1/publishers/google/models/${MODEL_ID}:${GENERATE_CONTENT_API}?key=${API_KEY}" -d '@request.json'
