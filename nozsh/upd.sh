#!/bin/bash

BASE_DIR="nozsh"
BLOG_DIR="$BASE_DIR/blog"
KB_DIR="$BASE_DIR/kb"
HOME_DIR="$BASE_DIR/home"
BIO_DIR="$BASE_DIR/bio"

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

git_submodule_update_force() {
  echo "- submodule update force"
  git submodule foreach --recursive git reset --hard
  git submodule update --remote
  echo
}

git_submodule_update() {
  echo "- submodule update"
  git submodule update --remote --merge
  echo
}

generate_hugo_content() {
    echo "- hugo generate"
    hugo
    echo
}

generate_node_twcss_hugo_content() {
  echo "- Tailwind & Hugo Generate"
  npm run build
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

update_home() {
    echo -e -n "- Update Home\n\n"

    echo "- cd to $HOME_DIR"
    cd $HOME_DIR
    echo

    clean_and_pull

    git_submodule_update_force

    generate_node_twcss_hugo_content

    # cp static/sitemap.xml public/sitemap.xml
    # cp static/index.html public/index.html
    # cp static/404.html public/404.html

    echo "- Done!"
}

update_bio() {
    echo -e -n "- Update Bio\n\n"

    echo "- cd to $BIO_DIR"
    cd $BIO_DIR
    echo

    clean_and_pull

    git_submodule_update_force

    generate_node_twcss_hugo_content

    echo "- Done!"
}

message="- [01]: Update Blog \n- [02]: Update Knowledge Base \n- [03]: Update Home \n- [04]: Update Bio \n- [**]: Exit"

echo -e -n "\n" && echo "- Update Script"
echo -e -n "\n"
echo -e $message

read -p $'- $: ' choice

case "$choice" in
    1) update_blog ;;
    2) update_knowledge_base ;;
    3) update_home ;;
    4) update_bio ;;
    *) clear
        echo -e -n "- Update Script\n"
        echo -e -n "- EXIT\n"
        exit 0
        ;;
esac