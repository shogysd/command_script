if [ $# = 0 ]; then
    echo "error: nothing arguments"
elif [ $# -gt 1 ]; then
    echo "error: many arguments"
elif [ "$(echo $1 | rev | cut -c 1)" != "/" ]; then
    echo "$1 's late char is not '/'"
else
    declare -a path_list=();
    path_list=${PATH//:/ };

    for path in ${path_list[@]};
    do
        if [ "$1" = "$path" ]; then
            echo "$1 is already exist in \$PATH"
            return 1
        fi
    done
    export PATH=$PATH":$1"
    exit 0
fi
