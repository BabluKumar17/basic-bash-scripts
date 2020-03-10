# This code will extract the output from the "tmp2" file, 
# and show the 5 shortest and longest response times to a domain.

echo '=================='
echo "Shortest Time"
awk '{print $8}' tmp2 | sort -u | head -7 | tail -5
echo '=================='

echo "Longest Time"
echo "=================="
awk '{print $8}' tmp2 | sort -u | tail -5
echo "=================="
