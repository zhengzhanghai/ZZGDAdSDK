export LANG=en_US.UTF-8

security unlock-keychain  -p "zheng78230" ~/Library/Keychains/login.keychain

#赋值framework名字,这个名字要和workspace, scheme名称相同
FRAMEWORK_NAME='ZZGDAdSDK'

## green to echo
function greenEcho(){
    echo -e "\033[32m[ $1 ]\033[0m"
}

#输出报错log并停止运行
function errorLogExit()
{
    echo "\033[01;31m[ $1 ]\033[0m"
    exit $2
}

#pod 安装.......................
greenEcho "pod 安装开始......................."
{
    /usr/local/bin/pod install --repo-update
} || {
    errorLogExit "pod 安装失败" 101
}
greenEcho "pod 安装完成......................."

#清理
greenEcho "清理开始.........................."
{
    xcodebuild -workspace ${FRAMEWORK_NAME}.xcworkspace -scheme ${FRAMEWORK_NAME} -configuration 'Release' clean
    
    if [ -d Products ]
    then
    rm -rf Products
    fi
    
} || {
    errorLogExit "xcode 清理失败" 102
}
greenEcho "清理完成.........................."

#真机build一下
greenEcho "清理build开始.........................."
{
    xcodebuild OTHER_CFLAGS="-fembed-bitcode" -workspace ${FRAMEWORK_NAME}.xcworkspace -scheme ${FRAMEWORK_NAME} -configuration 'Release' -sdk iphoneos
} || {
    errorLogExit "xcode 编译真机失败" 103
}

greenEcho "真机build完成.........................."

#模拟器build一下
greenEcho "模拟器build开始.........................."
{
    xcodebuild OTHER_CFLAGS="-fembed-bitcode" -workspace ${FRAMEWORK_NAME}.xcworkspace -scheme ${FRAMEWORK_NAME} -configuration 'Release' -sdk iphonesimulator
} || {
    errorLogExit "xcode 编译模拟器失败" 104
}
greenEcho "模拟器build完成.........................."

#合并
greenEcho "framrwork 合并开始.........................."
{
    xcodebuild -workspace ${FRAMEWORK_NAME}.xcworkspace -scheme MergeFramework SUPPORTS_MACCATALYST=NO
} || {
    errorLogExit "framrwork 合并失败" 105
}
greenEcho "framrwork 合并完成.........................."


#查看framework包含架构
#greenEcho "查看framework 架构.........................."
#cd Products/${FRAMEWORK_NAME}.framework
#file ${FRAMEWORK_NAME}


greenEcho "BuildFramework 完成.........................."



