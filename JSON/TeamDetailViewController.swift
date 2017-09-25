//
//  TeamDetailViewController.swift
//  JSON
//
//  Created by Parker Donat on 9/13/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit
import MessageUI

class TeamDetailViewController: UIViewController, UIToolbarDelegate, ImageViewDelegate, MFMailComposeViewControllerDelegate {
    
    var teamMember: TeamMember?
    var team: [TeamMember] = []

    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var avatar1: ImageView!
    @IBOutlet weak var avatar2: ImageView!
    @IBOutlet weak var avatar3: ImageView!
    @IBOutlet weak var avatar4: ImageView!
    @IBOutlet weak var avatar5: ImageView!
    @IBOutlet weak var avatar6: ImageView!
    
    let placeHolder = UIImage(named: "noImage.png")
    
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
        
        team = TeamController.getTeamMembers()
        title = fullName
        bioLabel.text = bio
        setUpImages()
        
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
    
    func setUpImages() {
        guard let teamMember = teamMember else { return }
        let member2 = team[14]
        let member3 = team[4]
        let member4 = team[11]
        let member5 = team[13]
        let member6 = team[9]
        
        avatar1.imageView.downloadedFrom(link: teamMember.avatar, placeHolder: placeHolder)
        avatar2.imageView.downloadedFrom(link: member2.avatar)
        avatar3.imageView.downloadedFrom(link: member3.avatar)
        avatar4.imageView.downloadedFrom(link: member4.avatar)
        avatar5.imageView.downloadedFrom(link: member5.avatar)
        avatar6.imageView.downloadedFrom(link: member6.avatar)
        
        avatar1.delegate = self
        avatar2.delegate = self
        avatar3.delegate = self
        avatar4.delegate = self
        avatar5.delegate = self
        avatar6.delegate = self        
    }
    
    //MARK: - Actions

    @IBAction func saveButtonTapped(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    //Mark: ImageViewDelegate Methods
    
    func didlongPressedOnImage(_ sender: ImageView) {
        avatar1.closeButton.isHidden = false
        avatar2.closeButton.isHidden = false
        avatar3.closeButton.isHidden = false
        avatar4.closeButton.isHidden = false
        avatar5.closeButton.isHidden = false
        avatar6.closeButton.isHidden = false
    }
    
    func didTapCloseButton(_ sender: ImageView) {
        sender.closeButton.isHidden = true
        sender.imageView.image = nil
        sender.imageView.backgroundColor = .gray
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
        let alertController = UIAlertController(title: "Could Not Send Email", message: "Your device could not send email. Please check your email configurations and try again.", preferredStyle: .alert)
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


