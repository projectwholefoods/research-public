# API CONFIGURATION
API_MODEL="gemini-3.1-pro-preview"
API_VERSION="v1beta"                                            # || v1
API_ACCESS="[REDACTED]"                                         # || [REDACTED]
API_ENDPOINT="generativelanguage"                               # || aiplatform
ENDPOINT_URL="googleapis.com"
MODEL_PATH="models"                                             # || publishers/google/models
API_METHOD="streamGenerateContent"


# REGIONAL SETTINGS
# API_REGION_1="us-central1-"                                   # comment for global
PROJECT="[REDACTED]"
LOCATION="global"
# API_REGION_2="projects/${PROJECT}/locations/${LOCATION}/"

# POST WITH REQUEST
curl \
-X POST \
-H "Content-Type: application/json" \
"https://${API_REGION_1}${API_ENDPOINT}.${ENDPOINT_URL}/${API_VERSION}/${API_REGION_2}${MODEL_PATH}/${API_MODEL}:${API_METHOD}?key=${API_ACCESS}" \
-d @GEMINI.json
