#!/bin/bash

# 设置颜色
PINK='\033[0;35m'   # 粉红色
GREEN='\033[0;32m'  # 绿色
RESET='\033[0m'     # 重置颜色

# 显示命令列表
function show_main_menu {
    echo -e "${PINK}1.${RESET} ${GREEN}更新系统及安装必要的插件${RESET}\n"
    echo -e "${PINK}2.${RESET} ${GREEN}Eooce SSH工具${RESET}\n"
    echo -e "${PINK}3.${RESET} ${GREEN}Kejilion SSH工具${RESET}\n"
    echo -e "${PINK}4.${RESET} ${GREEN}DD脚本（bin45678）${RESET}\n"
    echo -e "${PINK}5.${RESET} ${GREEN}nezha优先展示IPv6旗帜${RESET}\n"
    echo -e "${PINK}6.${RESET} ${GREEN}一键搭建hysteria2（Alpine）${RESET}\n"
    echo -e "${PINK}7.${RESET} ${GREEN}一键搭建Hysteria2+端口跳跃（Ubuntu、Debian）${RESET}\n"
    echo -e "${PINK}8.${RESET} ${GREEN}流媒体检测（是否原生）${RESET}\n"
    echo -e "${PINK}9.${RESET} ${GREEN}甬哥Sing-Box${RESET}\n"
    echo -e "${PINK}10.${RESET} ${GREEN}3X-UI${RESET}\n"
    echo -e "${PINK}11.${RESET} ${GREEN}X-UI（Alpine）${RESET}\n"
    echo -e "${PINK}12.${RESET} ${GREEN}甲骨文保活${RESET}\n"
    echo -e "${PINK}13.${RESET} ${GREEN}WARP${RESET}\n"
    echo -e "${PINK}14.${RESET} ${GREEN}VPS回程测试${RESET}\n"
    echo -e "${PINK}15.${RESET} ${GREEN}退出脚本${RESET}\n"
}

# 显示WARP二级菜单
function show_warp_menu {
    echo -e "${PINK}1.${RESET} ${GREEN}WARP安装${RESET}\n"
    echo -e "${PINK}2.${RESET} ${GREEN}WARP Go安装${RESET}\n"
    echo -e "${PINK}3.${RESET} ${GREEN}YGKKK WARP脚本${RESET}\n"
}

# 主菜单
show_main_menu
echo -e "请输入你想执行的命令序号（1-15）："
read choice

# 执行相应的命令
case $choice in
    1)
        apt update -y && apt install -y curl && apt install -y socat && apt install -y wget -y
        ;;
    2)
        curl -fsSL https://raw.githubusercontent.com/eooce/ssh_tool/main/ssh_tool.sh -o ssh_tool.sh && chmod +x ssh_tool.sh && ./ssh_tool.sh
        ;;
    3)
        curl -sS -O https://kejilion.pro/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
        ;;
    4)
        curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && chmod +x  reinstall.sh && ./reinstall.sh
        ;;
    5)
        bash <(curl https://raw.githubusercontent.com/xykt/Utilities/main/nezha/ipv6flag.sh)
        ;;
    6)
        wget -O hy2.sh https://raw.githubusercontent.com/zrlhk/alpine-hysteria2/main/hy2.sh && sh hy2.sh
        ;;
    7)
        wget -O hy2.sh https://raw.githubusercontent.com/ypkin/hysteria-setup/refs/heads/main/hy2.sh && chmod +x hy2.sh && ./hy2.sh
        ;;
    8)
        bash <(curl -L -s media.ispvps.com)
        ;;
    9)
        bash <(curl -Ls https://gitlab.com/rwkgyg/sing-box-yg/raw/main/sb.sh)
        ;;
    10)
        bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
        ;;
    11)
        apk add curl && apk add bash && bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/alpine-xui.sh)
        ;;
    12)
        curl -L https://gitlab.com/spiritysdx/Oracle-server-keep-alive-script/-/raw/main/oalive.sh -o oalive.sh && chmod +x oalive.sh && bash oalive.sh
        ;;
    13)
        # WARP 二级菜单
        show_warp_menu
        echo -e "请输入你想执行的WARP命令序号（1-3）："
        read warp_choice
        case $warp_choice in
            1)
                wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh 4
                ;;
            2)
                wget -N https://gitlab.com/fscarmen/warp/-/raw/main/warp-go.sh && bash warp-go.sh
                ;;
            3)
                bash <(wget -qO- https://gitlab.com/rwkgyg/CFwarp/raw/main/CFwarp.sh 2> /dev/null)
                ;;
            *)
                echo "无效的WARP选项，退出脚本。"
                ;;
        esac
        ;;
    14)
        wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
        ;;
    15)
        echo "退出脚本。"
        exit 0
        ;;
    *)
        echo "无效的序号，请输入 1 到 15 之间的数字。"
        ;;
esac

# 命令执行完后退出脚本
exit 0
