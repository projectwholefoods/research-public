cat << EOF > request.json
{
    "anthropic_version": "vertex-2023-10-16"
    ,"stream": true
    ,"max_tokens": 512
    ,"system": "<ROOT_PROMPT>"
    ,"temperature": 0
    ,"messages": [
        {
            "role": "user",
            "content": [
            ]
        }
    ]
}
EOF

ENDPOINT="aiplatform.googleapis.com"
LOCATION_ID="global"
PROJECT_ID="solar-spot-484612-n1"
MODEL_ID="claude-sonnet-4-5"
METHOD="streamRawPredict"

curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d @request.json \
"https://${ENDPOINT}/v1/projects/${PROJECT_ID}/locations/${LOCATION_ID}/publishers/anthropic/models/${MODEL_ID}:${METHOD}"
