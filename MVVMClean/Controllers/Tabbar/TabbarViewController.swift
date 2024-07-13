//
//  TabbarViewController.swift
//  MVVMClean
//
//  Created by Mac mini on 12/07/2024.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItem()
        setupTabberStyle()
        self.delegate = self
        
    }
    func setupTabberStyle(){
        tabBar.backgroundColor = .white
    }
    func setupTabbarItem(){
        let userViewController =  UserMainViewController()
        let naviUserViewController = UINavigationController(rootViewController: userViewController)
        naviUserViewController.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person"), tag: 0)
        
        let albumViewController = AlbumMainViewController()
        let naviAlbumViewController = UINavigationController(rootViewController: albumViewController)
        naviAlbumViewController.tabBarItem = UITabBarItem(title: "Album", image: UIImage(systemName: "person.2.crop.square.stack"), tag: 1)
        
        let postViewControlle = PostMainViewController()
        let naviPostViewController = UINavigationController(rootViewController: postViewControlle)
        naviPostViewController.tabBarItem = UITabBarItem(title: "Post", image: UIImage(systemName: "note.text"), tag: 2)
        
        viewControllers = [naviUserViewController, naviAlbumViewController, naviPostViewController]
    }
    
}

extension TabbarViewController: UITabBarControllerDelegate{
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tabBarItems = tabBar.items else { return }
        
        let tabBarIndex = viewControllers?.firstIndex(of: viewController) ?? 0
        animateBounce(for: tabBarItems[tabBarIndex])
    }
    
    private func animateBounce(for tabBarItem: UITabBarItem) {
        guard let tabBarItemView = tabBarItem.value(forKey: "view") as? UIView else { return }
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.2, 0.9, 1.1, 1.0]
        bounceAnimation.duration = 0.3
        bounceAnimation.calculationMode = .cubic
        
        tabBarItemView.layer.add(bounceAnimation, forKey: "bounce")
    }
}
