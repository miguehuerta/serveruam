echo "hola"

php_root=$(grep "^php_root=" config.conf | cut -d'=' -f2)

echo $php_root
