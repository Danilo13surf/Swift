import Foundation
import UIKit

extension String {
    func toDate(withFormat format: String = "dd/MM/yyyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func toString(withFormat format: String = "dd/MM/yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension UIColor {
    class var primary: UIColor {
        return .blue
    }
    class var background: UIColor {
        return .white
    }
}

extension String {
    func onlyNumbers() -> String {
        guard let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive) else {
            return ""
        }
        return regex.stringByReplacingMatches(in: self, options: .init(rawValue: 0), range: NSMakeRange(0, count), withTemplate: "")
    }
}

extension UIColor {
    static func fromHexString(_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count != 6 {
            return UIColor.white
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}

extension UITableView {
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, ofType type: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError("A celula não foi registrada na tableView")
        }
        return cell
    }
}

//Exemplo de chamadas

let date = "27/05/2021".toDate()
let dateString = date?.toString()

let view = UIView()
view.backgroundColor = .background

let value = "123ABC45"
print(value.onlyNumbers())

let color: UIColor = .fromHexString("#c1c1c1")

let tableView = UITableView()
let cell = tableView.dequeueReusableCell(for: indexPath, ofType: CustomTableViewCell.self)
