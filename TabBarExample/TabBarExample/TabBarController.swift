//
//  TabBarController.swift
//  TabBarExample
//
//  Created by 박진수 on 2020/10/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let tabColor = UIColor(red: 0.0, green: 16.0 / 255.0, blue: 80.0 / 255.0, alpha: 0.3)
        print(tabBar.frame.height)
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = tabColor
        
        
        if let tabBarItems = tabBar.items {
            tabBarItems.forEach { item in
                item.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 9, weight: .regular)], for: .normal)
                
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TabBarController: UITabBarControllerDelegate {
    // 지정한 탭의 활셩 여부를 동적으로 결정할 수 있는 코드
    // true는 활성화, false는 비활성황
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // selected
    }
}
