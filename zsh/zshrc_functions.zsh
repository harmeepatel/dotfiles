#!/usr/bin/zsh

ffc(){
    cd $(dirname $(fzf))
}

cocYarnInstall() {
    cwd=$(pwd)
    echo "exiting $green$bold$italic$cwd\n$normal" &&
    cd .local/share/nvim/site/pack/packer/start/coc.nvim &&
    yarn install &&
    cd $cwdForCoc &&
    echo "\nentering $green$bold$italic$cwd$normal" &&
}

gitacp(){
	if [[ "$1" == "" ]]
	then
		echo "enter a message..."
        return
	else
		git add .
		git commit -m "$1"
		git push
	fi
}

cn(){
	if [[ $1 == "cf" ]]
	then
		if [ -f ~/Developer/CP/codeforces/$2.cpp ];then
			subl ~/Develope/CP/codeforces/$2.cpp
		else
			touch ~/Developer/CP/codeforces/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/codeforces/$2.cpp
			cd codeforces
			nvim $2.cpp
		fi
	fi

	if [[ $1 == "lc" ]]
	then
		if [ -f ~/Developer/CP/leetcode/$2.cpp ];then
			subl ~/Developer/CP/leetcode/$2.cpp
		else
			touch ~/Developer/CP/leetcode/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/leetcode/$2.cpp
			cd leetcode
			nvim $2.cpp
		fi
	fi
	if [[ $1 == "at" ]] then
		if [ -f ~/Developer/CP/atcoder/$2.cpp ]; then
			subl ~/Developer/CP/atcoder/$2.cpp
		else
			touch ~/Developer/CP/atcoder/$2.cpp
			cp ~/Developer/CP/template.cpp ~/Developer/CP/atcoder/$2.cpp
			cd atcoder
			nvim $2.cpp
		fi
	fi
}

g++(){
	g++-10 -std=c++17 -O2 -Wall $1 && ./a.out && rm -rf a.out
}

mkcd(){
	mkdir $1 && cd $1
}

remove_ds(){
    find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
}

opnssl_enc(){
        openssl enc -aes-256-cbc -e -in $1 -out $2
}
opnssl_dec(){
        openssl enc -aes-256-cbc -d -in $1 -out $2
}

ytdl_best_mp3(){
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 $1
}
