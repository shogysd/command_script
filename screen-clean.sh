echo -n "cleanup detached screen?: y-or-n: "
read start
if [ $start = "y" ]; then
    for id in `screen -ls | grep -e '(' -e ')' | tr '.' ' ' | grep 'Detached' | awk '{print $1}'`; do
        screen -S ${id} -X quit
    done
elif [ $start = "n" ]; then
    echo "EXIT"
else
    echo "error"
fi
