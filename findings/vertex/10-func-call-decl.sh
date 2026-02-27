cat << EOF > request.json
{
    "contents": [
        {
            "role": "user",
            "parts": [
            ]
        }
    ]
    , "tools": [
      {
        "functionDeclarations": [
          {
            "name": "mytestfunction",
            "description": "description of my test function",
            "parameters": {
              "type": "object",
              "properties": {
                "myproperty": {
                  "type": "string"
                },
                "myproperty2": {
                  "type": "array",
                  "items": {
                    "type": "integer"
                  }
                }
              },
              "required": [
                "myproperty"
              ],
              "propertyOrdering": [
                "myproperty",
                "myproperty2"
              ]
            }
          },
          {
            "name": "mytestfunction2",
            "description": "required description",
            "parameters":
          },
        ]
      },
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
        ,"topP": 0.95
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
