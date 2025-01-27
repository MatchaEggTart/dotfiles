
# 获取当前路径
# current_path="$(pwd)"
# echo $current_path

# current_dir=$(pwd)
# parent_dir=$(dirname "$current_dir")
parent_dir="$HOME/dotfiles"
# echo "The parent directory is: $parent_dir"

if [ ! -d "${parent_dir}/hypr" ];then
    echo "folder is not exist"
else
    rm -rf "${parent_dir}/hypr"
fi
 
cp -r $HOME/.config/hypr "${parent_dir}/"
 
ls -al $parent_dir/hypr
