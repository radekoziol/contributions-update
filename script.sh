#!/bin/bash

USERNAME=""
PASSWORD=""
ACCESS_TOKEN=""
TYPE=""


: '
      https://github.com/username/reponame.git
char: 0      8          20               -4
'
https_part=$((8))
https_github_part=$((20 + ${#USERNAME}))
dot_git_part=$((-4));
function clone_all_repositories_branches () {

    curl 'https://api.github.com/user/repos?access_token='${ACCESS_TOKEN}'&type=${TYPE}' |
    grep -e 'clone_url*' |
    cut -d \" -f 4 |
    while read -r line; do command |
        curl https://api.github.com/repos/${USERNAME}/${line:${https_github_part}:${dot_git_part}}/branches?access_token=${ACCESS_TOKEN} |
        grep -e 'name*' |
        cut -d \" -f 4 |
        while read -r branch; do command |
            git clone -b $branch  \
                ${line:0:${https_part}}${USERNAME}:${PASSWORD}@github.com/${USERNAME}/${line:${https_github_part}} $branch-${line:${https_github_part}}; \
	    done;
	done;
}


function process_each_branch_repository (){

    cd tmp
    for d in */ ; do

        echo "Processing $d"
        cd ${1}/tmp/${d}

        var=$(eval git rev-parse --is-inside-work-tree && true)
        while [[ $var != "true" ]]
        do
            for d2 in */ ; do
                cd $d2
            done
            var=$(eval git rev-parse --is-inside-work-tree && true)
        done

        cp ${1}/script2.sh .
        eval ./script2.sh && true

    done
}

base_dir=$(eval pwd && true)

mkdir tmp && cd tmp

clone_all_repositories_branches
cd ..
process_each_branch_repository $(eval pwd && true)

cd ${base_dir} && rm -rf tmp
