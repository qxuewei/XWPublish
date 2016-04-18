# XWPublish
发布状态
=======

使用方法:
-------
        *1.导入'XWPublish'文件夹到项目中
        *2.导入 ' #import "XWPublishController.h" '
        *3.在需要发布的按钮点击方法中
            *XWPublishController *publishVC = [[XWPublishController alloc] init];
            *[self presentViewController:publishVC animated:YES completion:nil];
-------
*在XWPublishController.m中submitToServer方法中编写上传服务器的代码

-----
如果在文本输入框中长按复制,粘贴为英文,可以在info.plist中添加Localized resources can be mixed,设置为YES. 


[ 我的博客 ]( http://blog.csdn.net/qxuewei )