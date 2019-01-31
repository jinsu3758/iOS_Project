//
//  ViewController.swift
//  VideoCallExample
//
//  Created by 박진수 on 2018. 12. 20..
//  Copyright © 2018년 박진수. All rights reserved.
//

import UIKit
import RemoteMonster
import CallKit
import PushKit

class ViewController: UIViewController, CXProviderDelegate, PKPushRegistryDelegate {
    
    @IBOutlet weak var mRemoteView: UIView!
    @IBOutlet weak var mLocalView: UIView!
    @IBOutlet var remonCall: RemonCall!
    
    let provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "simpleApp"))
    let update = CXCallUpdate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remonCall = RemonCall()
        remonCall.remoteView = mRemoteView
        remonCall.localView = mLocalView
        remonCall.serviceId = "simpleapp"
        remonCall.serviceKey = "e3ee6933a7c88446ba196b2c6eeca6762c3fdceaa6019f03"
        provider.setDelegate(self, queue: nil)
//        update.remoteHandle = CXHandle(type: .generic, value: "simpleapp")
//        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
        voipRegistration()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendCall(_ sender: Any) {
        let uuid = UUID()
        
        remonCall.connect("simpleapp")
        remonCall.onConnect { id in
            if let channelId = id {
                let controller = CXCallController()
                let handle = CXHandle(type: .generic, value: channelId)
                let startCallAction = CXStartCallAction(call: uuid, handle: handle)
                let transaction = CXTransaction(action: startCallAction)
                
                controller.request(transaction, completion: { error in
                    if let error = error {
                        print("error!!", error)
                    }
                    else {
                        //푸시 발송 요청
                    }
                })
            }
        }
    }
    
    // Called when the provider performs the specified answer call action.
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
        print("전화 받음!!")
//        remonCall.connect(action.callUUID.uuidString)
//        remonCall.onComplete {
//            print("connection completed")
//        }
    }
    
    // MARK: 전화를 받았을 경우
    func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        action.fulfill()
        
    }
    
    // MARK: 전화를 끊었을 경우
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
        print("전화 끊음!!")
        remonCall.closeRemon()
    }
    
    // Notifies the delegate when the push credentials have been updated.
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        let token = pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined()
        let data = NSData(data: pushCredentials.token)
        print("token is data", data.description)
        print("token is ", token)
    }

    // delegate에게 push알림을 받았음을 알림
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        print("push알림 옴!!")
        let data = payload.dictionaryPayload
        let aps = (data["aps"] as! [String: String])
        if let channelId = aps["alert"] {
            print("알림 띄우기!!")
            update.remoteHandle = CXHandle(type: .generic, value: channelId)
            provider.reportNewIncomingCall(with: UUID(), update: update, completion: {_ in})
        }
    }
    
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    func voipRegistration() {
        let mainQueue = DispatchQueue.main
        let voipRegistry: PKPushRegistry = PKPushRegistry(queue: mainQueue)
        voipRegistry.delegate = self
        voipRegistry.desiredPushTypes = [.voIP]
    }
    
}

