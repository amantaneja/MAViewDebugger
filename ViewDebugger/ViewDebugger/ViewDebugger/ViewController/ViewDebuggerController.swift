import UIKit

class FloatingButtonController: UIViewController {

    private let window = FloatingButtonWindow()
    private var customView: UIView?

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

   init(view: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.customView = view
        self.window.rootViewController = self
    }

    override func loadView() {
        self.view = window.parentView
    }
}
