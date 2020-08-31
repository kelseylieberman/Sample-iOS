//
//  ContactsViewController.swift
//  sample_project
//
//  Created by Kelsey Lieberman on 8/27/20.
//  Copyright © 2020 Kelsey Lieberman. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var ContactsTableView: UITableView!
    
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
        ContactsTableView.dataSource = self
        ContactsTableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
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
