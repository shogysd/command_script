if [ $# = 0 ]; then
    echo "error: nothing arguments"
elif [ $# = 1 ]; then
    echo "error: inadequate arguments"
elif [ $# -gt 2 ]; then
    echo "error: many arguments"
else
    if [ "$1" = "$2" ]; then
        echo "True"
    else
        echo "False"
    fi
fi
