# PopOverController

iOS8之后新增了`UIPopoverPresentationController`,可以实现类似于iPad的`UIPopoverController`.


第一步:
打开`Main.storyboard`,在默认的`ViewController`中添加一个UIButton,然后新建一个UIView
Controller,并将UIButton的action事件指向新创建的`ViewController`.
如下图所示:
![Main.storyboard示例图.png](http://upload-images.jianshu.io/upload_images/670377-d67d3ecbf11e1650.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

第二步:
打开`ViewController.swift`,并添加代码.
```
import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var button: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let vc = segue.destination
        vc.modalPresentationStyle = .popover
        //箭头所指区域
        vc.popoverPresentationController?.sourceView = button
        vc.popoverPresentationController?.sourceRect = button.bounds
        //箭头方向
        vc.popoverPresentationController?.permittedArrowDirections = .up
        //设置代理
        vc.popoverPresentationController?.delegate = self
        //弹出窗口大小
        vc.preferredContentSize = CGSize(width: 200, height: 300)
    }
    
    //iPhone下默认是.overFullScreen(全屏显示)，需要返回.none，否则，没有弹窗效果。iPad不需要
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
```

注意事项:
- 遵守`UIPopoverPresentationControllerDelegate`代理
- 实现`adaptivePresentationStyle`代理方法,并返回`.none`.(iPhone下默认是.overFullScreen)
- 如果按钮不是UIButtton,而是导航栏上的UIBarButtonItem.由于该控件没有指定的frame,无法设置`sourceView`和`sourceRect`,将箭头所指区域下的两行代码修正一下即可:
`vc.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem;`


![弹窗效果.png](http://upload-images.jianshu.io/upload_images/670377-bc421030489e164b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
