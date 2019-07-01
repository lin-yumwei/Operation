#!/bin/bash
echo -e "\033[33m创建快照 0
通过快照恢复虚拟机 1
删除快照 2\033[0m"
read -p "请输入编号(0,1,2)  " c
if [ $c -eq 0 ];then
virsh list --all
read -p "请输入需要快照的虚拟机名字  " a
virsh snapshot-list "$a"
read -p "请输入创建快照名字  " b
virsh snapshot-create-as "$a" --name "$b"
virsh snapshot-list "$a"
exit
elif [ $c -eq 1 ];then
virsh list --all
read -p "请输入需要恢复的虚拟机名字  " d
virsh snapshot-list "$d"
read -p "请输入恢复快照名字  " f
virsh destroy --domain "$d" > /dev/null
virsh snapshot-revert --domain "$d" --snapshotname "$f" --running
echo 已恢复"$d"
exit
elif [ $c -eq 2 ];then
virsh list --all
read -p "请输入需要删除的虚拟机名字  " g
virsh snapshot-list "$g"
read -p "请输入删除快照名字  " l
virsh snapshot-delete --domain "$g" --snapshotname "$l"
virsh snapshot-list "$g"
echo 已删除快照"$l"
exit
fi
