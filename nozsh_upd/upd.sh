#!/bin/bash

BASE_DIR="nozsh"
BLOG_DIR="$BASE_DIR/blog"
KB_DIR="$BASE_DIR/kb"
XCOM_DIR="$BASE_DIR/xcom"
HOME_DIR="$BASE_DIR/home"

clean_and_pull() {
    echo "- Del 'public' & 'resources'"
    rm -rf public/ resources/
    echo

    echo "- Git Pull!"
    git pull
    echo
}

git_pull_only() {
    echo "- Git Pull!"
    git pull
    echo
}

generate_hugo_content() {
    echo "- hugo generate"
    hugo
    echo
}

update_blog() {
    echo -e -n "- Update Blog\n\n"

    echo "- cd to $BLOG_DIR"
    cd $BLOG_DIR
    echo

    clean_and_pull

    generate_hugo_content

    echo "- Done!"
}

update_knowledge_base() {
    echo -e -n "- Update Knowledge Base\n\n"

    echo "- cd to $KB_DIR"
    cd $KB_DIR
    echo

    clean_and_pull

    generate_hugo_content

    echo "- Done!"
}

update_xcom() {
    echo -e -n "- Update XCOM\n\n"

    echo "- cd to $XCOM_DIR"
    cd $XCOM_DIR
    echo

    git_pull_only

    echo "- Done!"
}

update_home() {
    echo -e -n "- Update Home\n\n"

    echo "- cd to $HOME_DIR"
    cd $HOME_DIR
    echo

    clean_and_pull

    generate_hugo_content

    echo "- Done!"
}

message="- [01]: Update Blog \n- [02]: Update Knowledge Base \n- [03]: Update XCOM \n- [04]: Update Home \n- [**]: Exit"

echo -e -n "\n" && echo "- Update Script"
echo -e -n "\n"
echo -e $message

read -p $'- $: ' choice

case "$choice" in
    1) update_blog ;;
    2) update_knowledge_base ;;
    3) update_xcom ;;
    4) update_home ;;
    *) clear
       echo -e -n "- Update Script\n"
       echo -e -n "- EXIT\n"
       exit 0
       ;;
esac
