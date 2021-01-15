nl=$'\n'
file=''
echo "SETUP DOCKER IMAGE WITH SSL"
echo "---------------------------"
echo ""

echo " Set Domain (required)"
printf " >> "
read domain
if [ -z "$domain" ]; then exit 1; fi
str="DOMAIN=$domain\n"
file+=$str
echo ""

echo " Set Email (required)"
printf " >> "
read email
if [ -z "$email" ]; then exit 1; fi
str="EMAIL=$email\n"
file+=$str
echo ""

echo " Set Destination Name (default: placeholder)"
printf " >> "
read destination_name
if [ -z "$destination_name" ]; then destination_name="placeholder"; fi
str="DESTINATION_NAME=$destination_name\n"
file+=$str
echo ""

echo " Set Destination Port (default: 8085)"
printf " >> "
read destination_port
if [ -z "$destination_port" ]; then destination_port="8085"; fi
str="DESTINATION_PORT=$destination_port"
file+=$str

echo $file > .env
echo ""

echo "A. Prepare docker-compose.yml & app.conf"
./init-templates.sh
echo "B. Add Certificates"
./init-letsencrypt.sh
echo "C. Rewrite app.conf"
./init-post.sh