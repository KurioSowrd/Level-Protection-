echo "------------------------------------------------------------------------------------------------------------------------------------"
echo "|                        系统环境检查脚本开发版prower by kuriocat                                                                   |"
echo "|                        脚本存放于github仓库，欢迎大家一起来完善它                                                                 |"
echo "|                        version  1.0                                                                                               |"
echo "|                        使用方法:bash 我的远程github仓库                                                                           |"
echo "|                        后续脚本加入对系统类型以及系统内核版本的识别                                                               |"
echo "|                                                                                                                                   |"
echo "------------------------------------------------------------------------------------------------------------------------------------"
Line="-------------------------------------------------------------------------------------------------------------------------------------------"
annotationfilter="|grep -v ^#"
echo "-----------------------------------------------------/etc/passwd/内容-------------------------------------------------------------"
command="cat /etc/passwd"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-----------------------------------------------------口令文件/etc/shadow----------------------------------------------------------"
command="cat /etc/shadow"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-----------------------------------------------------登录配置文件/etc/login.defs------------------------------------------------------------"
command="cat /etc/login.defs"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-----------------------------------------------认证文件 /etc/pam.d/system-auth-------------------------------------------------------"
command="cat /etc/pam.d/system-auth"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-----------------------------------------------系统配置文件/etc/profile---------------------------------------------------------------"
command="cat /etc/profile"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "------------------------------------------------sshd服务状态-------------------------------------------------------------------------"
service sshd status
echo $Line
echo $Line
echo "-----------------------------------------------------查看开机启动项systemctl list-unit-files------------------------------------------"
systemctl list-unit-files|grep enable
echo $bootunit
echo $Line
echo $Line
echo "-----------------------------------------------------查看passwd文件的权限分配情况----------------------------------------------------"
command="ls -l /etc/passwd"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-------------------------------------------------------查看ssh服务配置文件是否允许root远程登录-------------------------------------------------------------"
cat /etc/ssh/sshd_config|grep PermitRootLogin
echo $Line
echo $Line
echo "--------------------------------------------------------查看/etc/sudo.conf中有那些用户拥有超级管理员权限--------------------------------------"
command="cat /etc/sudo.conf"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-------------------------------------------------------查看SELINUX参数的设定------------------------------------------------------------"
command="cat /etc/selinux/config"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "---------------------------------------------------查看审计服务状态-----------------------------------------------------------------"
command="service auditd status"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "----------------------------------------------------查看审计进程守护进程状态---------------------------------------------------------"
command="ps -ef |grep auditd"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "----------------------------------------------------查看审计配置文件----------------------------------------------------------------"
command="cat /etc/audit/audit.rules"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "----------------------------------------------------查看当天审计日志---------------------------------------------------------------"
command="ausearch -ts today"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "---------------------------------------------------查看yum安装包管理器中已安装的组件-----------------------------------------------"
command="yum list installed"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "------------------------------------------------- 查看正在运行中的服务service --status-all|grep running---------------------------"
command="systemctl list-units --type=service"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "--------------------------------------------------查看是否已经关闭非必要的端口 netstat -nrlp-------------------------------------"
command="netstat -nrlp"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "------------------------------------------------/etc/hosts.allow查看允许访问IP地址---------------------------------------------"
command="cat /etc/hosts.allow"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "---------------------------------------------查看禁止访问的ip /etc/hosts.deny---------------------------------------------------"
command="cat /etc/hosts.allow"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "-------------------------------------查看安全日志 /var/log/secure|grep refused寻找被异常登入线索-----------------------------------"
command="cat /var/log/secure|grep refused"
eval  ${command}${annotationfilter}
echo $Line
echo $Line
echo "--------------------------------------查看版本发行信息cat /etc/issue-----------------------------------------------------------"
command="cat /etc/issue"
eval  ${command}${annotationfilter}
echo $Line
echo $Line