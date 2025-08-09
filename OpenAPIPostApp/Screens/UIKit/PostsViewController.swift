import UIKit
import SwiftUI

class PostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Posts"
        
        // 1. Create an instance of our SwiftUI view
        let postsListView = PostListView()
        
        // 2. Wrap the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: postsListView)
        
        // 3. Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // 4. Set up auto layout constraints to fill the entire screen
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 5. Notify the hosting controller that it has been moved
        hostingController.didMove(toParent: self)
    }
}