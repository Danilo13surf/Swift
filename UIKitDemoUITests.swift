import XCTest

extension XCUIElement {
    func clearText(andReplaceWith newText:String? = nil) {
        tap()
        tap() //When there is some text, its parts can be selected on the first tap, the second tap clears the selection
        press(forDuration: 0.3)
        let select = XCUIApplication().menuItems["Select"]
        //For empty fields there will be no "Select All", so we need to check
        if select.waitForExistence(timeout: 0.5), select.exists {
            select.tap()
            typeText(String(XCUIKeyboardKey.delete.rawValue))
            typeText(String(XCUIKeyboardKey.delete.rawValue))
        }
        if let newValue = newText { typeText(newValue) }
    }
}
