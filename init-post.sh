read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

domain=$(read_var DOMAIN .env)
destination_name=$(read_var DESTINATION_NAME .env)
destination_port=$(read_var DESTINATION_PORT .env)

str="        proxy_pass $domain;"
echo $str   
awk -v line=26 -v new_content="$str" '{
        if (NR == line) {
                print new_content;
        } else {    
                print $0;
        }
}' < ./data/nginx/app.conf > ./data/nginx/app.conf1

mv ./data/nginx/app.conf1 ./data/nginx/app.conf