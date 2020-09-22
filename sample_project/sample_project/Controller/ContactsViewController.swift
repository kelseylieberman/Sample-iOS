//
//  ContactsViewController.swift
//  sample_project
//
//  Created by Kelsey Lieberman on 8/27/20.
//  Copyright © 2020 Kelsey Lieberman. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController{
    
    @IBOutlet weak var ContactsTableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let transition = SlideTransition()
    
    var contacts: [Contact] = [
        Contact(firstName: "Tristan", lastName: "Chung", image: UIImage(systemName: "person.circle.fill")),
        Contact(firstName: "Jack", lastName: "Newsom", image: UIImage(systemName: "person.circle.fill")),
        Contact(firstName: "Kelsey", lastName: "Lieberman", image: UIImage(systemName: "person.circle.fill")),
        Contact(firstName: "Mike", lastName: "Hawk", image: UIImage(systemName: "person.circle.fill")),
        Contact(firstName: "Joe", lastName: "Mama", image: UIImage(systemName: "person.circle.fill"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ///Set controller or "delegate" of table view to the ContactsViewController (slef)
        ContactsTableView.delegate = self
        
        ContactsTableView.dataSource = self
        ContactsTableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
    }
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {return}
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true, completion: nil)
    }
    
    //Handles Menu Transitions
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
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

extension ContactsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
    }
}

extension ContactsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        let currentContact = contacts[indexPath.row]
        cell.personLabel.text = "\(String(describing: currentContact.firstName)) \(String(describing: currentContact.lastName))"
        cell.personImage.image = currentContact.image
        return cell
    }
    
    
}

extension ContactsViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
