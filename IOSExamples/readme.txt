1、打开Podfile，重命名Target，删除Pods、Podfile.lock和IOSExamples.xcworkspace
2、打开IOSExamples.xcworkspace，依次重命名Target、工程名、主文件夹和IOSExamples.entitlements
3、关闭工程，执行pod install
4、搜索替换IOSExamples和iosexamples
5、选着info.plist
6、修改bundle id
7、修改R.swift的Build Phases
8、修改APP名称
9、编译运行
10、删除IOSExamples的scheme
