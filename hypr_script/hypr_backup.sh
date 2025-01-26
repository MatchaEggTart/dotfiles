
# 获取当前路径
current_path="$(pwd)"
# echo $current_path

if [ ! -d "${current_path}/hypr" ];then
    echo "folder is not exist"
else
    rm -rf "${current_path}/hypr"
fi

cp -r $HOME/.config/hypr "${current_path}/"

ls -al $current_path/hypr
