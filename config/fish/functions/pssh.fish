function pssh
    set ip $(echo $argv[1] | awk -F"@" '{if ($2 == "") print $1; else print $2 }' | awk '{ print $1 }')
    ping -o $ip && ssh $argv
end
