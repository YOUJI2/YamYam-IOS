
import Foundation
import UIKit

extension UIViewController {
    
}

extension UILabel {
    func setLabelDesign(color : (red : Int, green : Int, blue : Int) = (red: 110, green: 110, blue: 110), font : NotoSansFont = .medium, size : Int = 15) {
        
        self.textColor = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
        self.font = UIFont(name: font.rawValue, size: 15)
        let number: CGFloat = -0.40
        let str = self.text ?? ""
        let letterSpace = NSMutableAttributedString(string: str)
        
        letterSpace.addAttribute(.kern, value: NSNumber(value: Float(number)), range: NSRange(location: 0, length: letterSpace.length))
        self.attributedText = letterSpace
    }
}

enum NotoSansFont : String {
    case black = "NotoSansCJKkr-Black"
    case bold = "NotoSansCJKkr-Bold"
    case demiLight = "NotoSansCJKkr-DemiLight"
    case light = "NotoSansCJKkr-Light"
    case medium = "NotoSansCJKkr-Medium"
    case regular = "NotoSansCJKkr-Regular"
    case thin = "NotoSansCJKkr-Thin"
}


//func a(){
//    let alable = UILabel()
//    alable.setLabelDesign(color: <#T##(red: Int, green: Int, blue: Int)#>, font: <#T##NotoSansFont#>, size: Int)
//
//alable.setLabelDesign(color: <#T##(red: Int, green: Int, blue: Int)#>, font: , size: <#T##Int#>)
//}




