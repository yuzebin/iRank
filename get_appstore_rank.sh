# china store
store_front=143465-19,4

# the cookies apple need
cookies=(
    "Host: itunes.apple.com" \
    "User-Agent: iTunes-iPod/5.1.1 (4; 8GB; dt:71)" \
    "Accept: */*" \
    "Accept-Language: zh-Hans;q=1.0,en;q=1.0,fr;q=0.9,de;q=0.9,ja;q=0.9,nl;q=0.9,it;q=0.8,es;q=0.8,pt;q=0.8,pt-PT;q=0.7,da;q=0.7,fi;q=0.7,nb;q=0.7,sv;q=0.6,ko;q=0.6,zh-Hant;q=0.6,ru;q=0.5,pl;q=0.5,tr;q=0.5,uk;q=0.5,ar;q=0.4,hr;q=0.4,cs;q=0.4,el;q=0.3,he;q=0.3,ro;q=0.3,sk;q=0.3,th;q=0.2,id;q=0.2,ms;q=0.2,en-GB;q=0.1,ca;q=0.1,hu;q=0.1,vi;q=0.1" \
    "X-Apple-Partner: origin.0" \
    "X-Apple-Connection-Type: WiFi" \
    "X-Apple-Client-Application: Software" \
    "X-Apple-Client-Versions: GameCenter/2.0" \
    "X-Dsid: 400453337" \
    "X-Apple-Store-Front: $store_front" \
    "Accept-Encoding: gzip, deflate" \
    "Connection: keep-alive"
    )

store_all_url="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?selected-tab-index=1&top-ten-m=42&genreId=36"
whether_url="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAutoSourcedGenrePage?id=6001&selected-tab-index=1&top-ten-m=42"
game_all_url="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAutoSourcedGenrePage?id=6014&showTopLevelGenre=true&selected-tab-index=1&top-ten-m=42"
game_strategy="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAutoSourcedGenrePage?id=7017&selected-tab-index=1&top-ten-m=42"
game_puzzle="http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAutoSourcedGenrePage?id=7012&selected-tab-index=1&top-ten-m=42"

CURL=curl
GZIP=gzip
GREP=grep
AWK=awk
SED=sed

# get_rank(rank_name rank_url)
get_rank()
{
    filename_pattern=$1_`date +%Y%m%dT%H%M`.txt
    format_command=" | $GZIP -d | $GREP \<key\>title\<\/key\> | $AWK -F'<string>' '{print \$2}' | $SED -e 's:\<\/string\>::g' > $filename_pattern"

    curl_cookie_param=

    for c in "${cookies[@]}";
        do
        curl_cookie_param=`echo $curl_cookie_param -H \"$c\"`;
    done

    curl_command_line="$CURL $curl_cookie_param \"$2\"$format_command"
    # echo $curl_command_line
    eval "$curl_command_line"
}

usage()
{
    echo "Usage: ";
    echo "    $0 game_all|whether|all";

}

if [ $# -eq 1 ]; then
    case $1 in
        game_all)
            get_rank "cn_game_all" $game_all_url
            ;;
        whether)
            get_rank "cn_wheather" $whether_url
            ;;
        all)
            get_rank "cn_all" $store_all_url
            ;;
        *)
            echo $0 game_all|whether|all
            ;;
    esac
else
    usage;
fi
