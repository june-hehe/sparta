//
//  DataManager.swift
//  MemoTest1
//
//  Created by DJ S on 2023/08/10.
//
import CoreData
import Foundation

// MARK: - Core Data stack
class DataManager {
    static let shared = DataManager()
    private init() {
        
    }
    
    var mainContenxt: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var memoList = [Memo]()
        
        func fetchMemo() {
            let request: NSFetchRequest<Memo> = Memo.fetchRequest()
            
            // 코어데이터가 리턴해주는 데이터는 기본적으로 정렬되어 있지 않음
            // 최근메모가 먼저 표시되도록, 날짜를 내림차순으로 정렬
            let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
            request.sortDescriptors = [sortByDateDesc]
            
            // 패치리퀘스트를 실행하고, 데이터를 가져오는코드
            do {
                memoList = try mainContenxt.fetch(request)
            } catch {
                print(error)
            }
            
        }
    
    func addNewMemo(_ memo: String?) {
        let newMemo = Memo(context: mainContenxt)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        memoList.insert(newMemo, at: 0)
        saveContext()
    }
    
    func deleteMemo(_ memo: Memo?) {
        if let memo = memo {
            mainContenxt.delete(memo)
            saveContext()
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MemoTest1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
