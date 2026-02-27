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
        ,"seed": -1210518613
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
