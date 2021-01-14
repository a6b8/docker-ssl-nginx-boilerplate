read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

domain=$(read_var DOMAIN .env)
destination_name=$(read_var DESTINATION_NAME .env)
destination_port=$(read_var DESTINATION_PORT .env)

sed -e "s/<<domain>>/$domain/g" \
    -e "s/<<destination_name>>/$destination_name/g" \
    -e "s/<<destination_port>>/$destination_port/g" \
    ./data/nginx/app.conf.template > ./data/nginx/app.conf

sed -e "s/<<destination_name>>/$destination_name/g" docker-compose.yml.template > docker-compose.yml
