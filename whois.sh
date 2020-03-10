# Extract name server from the whois.info file.

$domain=less whois.info | grep "Domain Name" | awk '{print $3}' | sed -n '1p'
less whois.info | grep $domain | grep ns | grep -v 'https' | awk '{print $3}'
