#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

target=$(docker-compose port teable 3000)

curl http://${target}/api/auth/signup \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8,fr;q=0.7' \
  -H 'content-type: application/json' \
  -H 'priority: u=1, i' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
  --data-raw '{"email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"}'



