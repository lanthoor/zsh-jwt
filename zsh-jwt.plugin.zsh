# Usage: jwt token_url client_id client_secret
function jwt() {
  local token_url=$1
  local client_id=$2
  local client_secret=$3
  local token=$(curl -s -X POST $token_url \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret" | jq -r '.access_token')
  echo $token
}

# Usage: jwt_decode token_url client_id client_secret
function jwt_decode() {
  local token=$(jwt $1 $2 $3)
  local payload=$(echo -n $token | cut -d "." -f2 | tr '_-' '/+')
  while [ $((${#payload} % 4)) -ne 0 ]; do
    payload=$payload=
  done
  echo $payload | base64 -d | jq .
}
