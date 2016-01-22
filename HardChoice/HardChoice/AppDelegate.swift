//
//  AppDelegate.swift
//  HardChoice
//
//  Created by 杨萧玉 on 14-7-1.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

import UIKit
import CoreData
import DataKit
#if !DEBUG
import Fabric
import Crashlytics
#endif
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), forBarMetrics: .Default)
        let navigationController = self.window!.rootViewController as! UINavigationController
        let controller = navigationController.topViewController as! MasterViewController
//        controller.managedObjectContext = managedObjectContext
        controller.managedObjectContext = DataAccess.sharedInstance.managedObjectContext
//        let containerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier("iCloud.com.yulingtianxia.HardChoice")
//        if containerURL != nil {
//            println("success:\(containerURL)")
//        }
//        else{
//            println("URL=nil")
//        }
        #if !DEBUG
        Fabric.with([Crashlytics()])
        #endif
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
        DataAccess.sharedInstance.saveContext()
    }

//    func saveContext () {
//        var error: NSError? = nil
//        let managedObjectContext = self.managedObjectContext
//        if managedObjectContext != nil {
//            if managedObjectContext.hasChanges && !managedObjectContext.save(&error) {
//                // Replace this implementation with code to handle the error appropriately.
//                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                //println("Unresolved error \(error), \(error.userInfo)")
//                abort()
//            }
//        }
//    }
//
//    // MARK: - Core Data stack
//
//    // Returns the managed object context for the application.
//    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
//    var managedObjectContext: NSManagedObjectContext! {
//        if _managedObjectContext == nil {
//            let coordinator = self.persistentStoreCoordinator
//            if coordinator != nil {
//                _managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
//                _managedObjectContext?.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
//                _managedObjectContext?.persistentStoreCoordinator = coordinator
//            }
//        }
//        return _managedObjectContext!
//    }
//    var _managedObjectContext: NSManagedObjectContext? = nil
//
//    // Returns the managed object model for the application.
//    // If the model doesn't already exist, it is created from the application's model.
//    var managedObjectModel: NSManagedObjectModel {
//        if _managedObjectModel == nil {
//            let modelURL = NSBundle.mainBundle().URLForResource("HardChoice", withExtension: "momd")
//            _managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL!)
//        }
//        return _managedObjectModel!
//    }
//    var _managedObjectModel: NSManagedObjectModel? = nil
//
//    // Returns the persistent store coordinator for the application.
//    // If the coordinator doesn't already exist, it is created and the application's store added to it.
//    var persistentStoreCoordinator: NSPersistentStoreCoordinator! {
//        if _persistentStoreCoordinator == nil {
//            
//            let storeURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent("HardChoice.sqlite")
//            var error: NSError? = nil
//            _persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//            
//            // iCloud notification subscriptions
//            let dc = NSNotificationCenter.defaultCenter()
//            dc.addObserverForName(NSPersistentStoreCoordinatorStoresWillChangeNotification, object: self.persistentStoreCoordinator, queue: NSOperationQueue.mainQueue(), usingBlock: { (note) -> Void in
//                self.managedObjectContext.performBlock({ () -> Void in
//                    var error: NSError? = nil
//                    if self.managedObjectContext.hasChanges {
//                        if !self.managedObjectContext.save(&error) {
//                            println(error?.description)
//                        }
//                    }
//                    self.managedObjectContext.reset()
//                })
//            })
//            dc.addObserverForName(NSPersistentStoreCoordinatorStoresDidChangeNotification, object: self.persistentStoreCoordinator, queue: NSOperationQueue.mainQueue(), usingBlock: { (note) -> Void in
//                self.managedObjectContext.performBlock({ () -> Void in
//                    var error: NSError? = nil
//                    if self.managedObjectContext.hasChanges {
//                        if !self.managedObjectContext.save(&error) {
//                            println(error?.description)
//                        }
//                    }
//                })
//            })
//            dc.addObserverForName(NSPersistentStoreDidImportUbiquitousContentChangesNotification, object: self.persistentStoreCoordinator, queue: NSOperationQueue.mainQueue(), usingBlock: { (note) -> Void in
//                self.managedObjectContext.performBlock({ () -> Void in
//                    self.managedObjectContext.mergeChangesFromContextDidSaveNotification(note)
//                })
//            })
//            
//            if _persistentStoreCoordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: [NSPersistentStoreUbiquitousContentNameKey:"MyAppCloudStore"], error: &error) == nil {
//
//                println("Unresolved error \(error), \(error?.userInfo)")
//                abort()
//            }
//        }
//        return _persistentStoreCoordinator!
//    }
//    var _persistentStoreCoordinator: NSPersistentStoreCoordinator? = nil
//
//    // MARK: - Application's Documents directory
//                                    
//    // Returns the URL to the application's Documents directory.
//    var applicationDocumentsDirectory: NSURL {
////        return NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil,
////            create: true,
////            error: nil)!
//        let kMyAppGroupName = "group.com.yulingtianxia.HardChoice"
//        var sharedContainerURL:NSURL? = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(kMyAppGroupName)
//        return sharedContainerURL ?? NSURL()
//    }
    
}

