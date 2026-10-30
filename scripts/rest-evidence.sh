#!/bin/bash
# Generates the files for tasks 13-17: rest-create-done, rest-list-done,
# rest-read-done, rest-update-done, rest-delete-done  (cURL command + output)
#
# 1) In terminal 1:   export FORCE_HTTPS=false && make run
# 2) In terminal 2:   bash scripts/rest-evidence.sh
BASE="${BASE_URL:-http://localhost:8000}"
H='Content-Type: application/json'

run() {  # run <outfile> <curl args...> : saves the command and its output
  out="$1"; shift
  { echo "\$ curl $*"; curl -s -i "$@"; echo; } | tee "$out"
  echo "------------------------------------------------------------"
}

# CREATE
run rest-create-done -X POST "$BASE/accounts" -H "$H" \
  -d '{"name":"John Doe","email":"john@example.com","address":"123 Main St, Springfield","phone_number":"555-1234"}'
ID=$(grep -o '"id":[0-9]*' rest-create-done | head -1 | cut -d: -f2)
echo "Created account id = $ID"

# a second account so LIST shows more than one
curl -s -o /dev/null -X POST "$BASE/accounts" -H "$H" \
  -d '{"name":"Jane Roe","email":"jane@example.com","address":"456 Oak Ave, Shelbyville"}'

run rest-list-done   -X GET    "$BASE/accounts"
run rest-read-done   -X GET    "$BASE/accounts/$ID"
run rest-update-done -X PUT    "$BASE/accounts/$ID" -H "$H" \
  -d '{"name":"John Updated","email":"john@example.com","address":"789 New Rd, Springfield","phone_number":"555-9999"}'
run rest-delete-done -X DELETE "$BASE/accounts/$ID"
echo "Done. Files created: rest-create-done rest-list-done rest-read-done rest-update-done rest-delete-done"
