if [ $# = 1 ]; then
    history | \
        sed '$d' | \
        awk 'match($0, /.{5} {2}[^ ]{10} {1}[^ ]{10} {3}.*?'${1}'.*?/) { \
            split($0, tmp, " "); \
            printf "%5s  %10s %10s   ", tmp[1], tmp[2], tmp[3]; \
            gsub("'${1}'", "\033[1;31m'${1}'\033[0;39m", $0); \
            match($0, /.{5} {2}[^ ]+? {1}[^ ]+? {3}/); \
            print substr($0, RSTART+RLENGTH) \
            }'
    # | tail -n 100 2>/dev/null
    exit 0
elif [ $# = 0 ]; then
    echo "error: nothing arguments"
    exit 1
else
    echo "error: many arguments"
    exit 1
fi
