# API CONFIGURATION
API_MODEL="anthropic.claude-opus-4-6-v1"
#
API_ACCESS="[REDACTED]"
API_ENDPOINT="bedrock-runtime"
ENDPOINT_URL="amazonaws.com"
MODEL_PATH="model"
API_METHOD="invoke"


# REGIONAL SETTINGS
API_REGION_1="us-east-1"
#
#
API_REGION_2="global."                                          # comment for regional

# POST WITH REQUEST
curl \
-X POST \
-H "Content-Type: application/json" -H "Authorization: Bearer ${API_ACCESS}" \
"https://${API_ENDPOINT}.${API_REGION_1}.${ENDPOINT_URL}/${MODEL_PATH}/${API_REGION_2}${API_MODEL}/${API_METHOD}" \
-d @CLAUDE.json
