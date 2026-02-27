cat << EOF > request.json
{
    "anthropic_version": "vertex-2023-10-16"
    ,"stream": true
    ,"max_tokens": 63999
    ,"system": "<ROOT_PROMPT>"
    ,"stop_sequences": ["\"\"\""]
    ,"temperature": 0
    ,"top_p": 0
    ,"top_k": 0
    ,"messages": [
        {
            "role": "user",
            "content": [
            ]
        }
    ],
    "output_config": {
        "format": {
            "type": "json_schema",
            "schema": {
                <SCHEMA_JSON>
            }
        }
    }
    "tools": [
        {
            "name": "<TOOL_NAME>",
            "input_schema": {
                <TOOL_JSON>
            }
        },
        {
            "type": "web_search_20260209",
            "name": "web_search"
        },
        {
            "type": "web_fetch_20260209",
            "name": "web_fetch"
        },
        {
            "type": "code_execution_20250825",  //potentially unavailable
            "name": "code_execution"
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
