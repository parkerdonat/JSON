//
//  TeamDetailViewController.swift
//  JSON
//
//  Created by Parker Donat on 9/13/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit
import MessageUI

class TeamDetailViewController: UIViewController, UIToolbarDelegate, MFMailComposeViewControllerDelegate {
    
    var teamMember: TeamMember?
    var team: [TeamMember] = []

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var avatar1: UIImageView!
    @IBOutlet weak var avatar2: UIImageView!
    @IBOutlet weak var avatar3: UIImageView!
    @IBOutlet weak var avatar4: UIImageView!
    @IBOutlet weak var avatar5: UIImageView!
    @IBOutlet weak var avatar6: UIImageView!
    
    var fullName: String {
        guard let teamMember = teamMember else { return "" }
        return [teamMember.firstName, teamMember.lastName].flatMap({$0}).joined(separator:" ")
    }
    
    var bio: String {
        guard let teamMember = teamMember else { return "" }
        return teamMember.bio
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = fullName
        label.text = bio
        team = TeamController.sharedInstance.getTeamMembers()
        loadImages()
    
        // Removes Hairline in nav bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func loadImages() {
        
        guard let teamMember = teamMember else { return }
        let member2 = team[14]
        let member3 = team[4]
        let member4 = team[11]
        let member5 = team[13]
        let member6 = team[9]
        
        avatar1.downloadedFrom(link: teamMember.avatar)
        avatar2.downloadedFrom(link: member2.avatar)
        avatar3.downloadedFrom(link: member3.avatar)
        avatar4.downloadedFrom(link: member4.avatar)
        avatar5.downloadedFrom(link: member5.avatar)
        avatar6.downloadedFrom(link: member6.avatar)
    }
    
    //MARK: - Actions
    
    @IBAction func longPress(_ sender: Any) {
        
        // TODO: - unhide the close buttons, remove image to show background
        // Add func for closeButtonTapped
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    //MARK: - Mail
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["bsoumpholphakdy@sofi.org", "mjaffa@sofi.org", "tlawson@sofi.org"])
        mailComposerVC.setSubject("SoFi Project")
        mailComposerVC.setMessageBody("Sample project by Parker Donat.", isHTML: false)
        
        let screenshot =  UIImage.init(view: view)
        if let imageData = UIImageJPEGRepresentation(screenshot, 0.3) {
            mailComposerVC.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "screenshot")
        }
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let alertController = UIAlertController(title: "Could Not Send Email", message: "Your device could not send email. Please check email configuration and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in

        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

