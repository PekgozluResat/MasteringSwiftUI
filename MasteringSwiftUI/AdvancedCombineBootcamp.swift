//
//  AdvancedCombineBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 19/04/2022.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
   // @Published var basicPublisher: String = "first publish"
    let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
//        let items = ["one", "two", "three"]
        let items: [Int] = Array(1..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if (x > 4 && x < 8 ) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                }else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
//                self.basicPublisher = items[x]
            }
        }
    }
}

class AdvancedCombineBootcamViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var error: String = ""
    let dataService = AdvancedCombineDataService()
    
    var cancelables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughPublisher
        
            // Sequence operations
        /*
            //.first()
            //.first(where: { $0 > 4 })
            //.tryFirst(where: { int in
            //    if int == 3 {
            //        throw URLError(.badServerResponse)
            //    }
            //    return int > 4
            //})
            //.last()
            //.last(where: { $0 > 4 })
            //.tryLast(where: { int in
            //   if int == 3 {
            //       throw URLError(.badServerResponse)
            //   }
            //   return int > 1
            //})
            //.dropFirst()
            //.dropFirst(3)
            //.drop(while: { $0 < 5 })
//            .tryDrop(while: { int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return int < 6
//            })
//            .prefix(4)
//            .prefix(while: { $0 < 5 })
//            .tryPrefix(while: )
//            .output(at: 1)
//            .output(in: 2..<4)
         
         */
        
           // Mathematic Operations
        /*
           //.max()
//            .max(by: { int1, int2 in
//                return int1 < int2
//            })
//            .min()
//            .min(by: { <#Int#>, <#Int#> in
//                <#code#>
//            })
//            .tryMin(by: { <#Int#>, <#Int#> in
//                <#code#>
//            })
         */
        
           // Filter / Reducing Operations
        /*
//            .map( { String($0) })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return String(int)
//            })
//            .compactMap({ int in
//                if int == 5 {
//                    return nil
//                }
//                return String(int)
//            })
//            .tryCompactMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return String(int)
//            })
//            .filter({ $0 > 4 && $0 < 7})
//            .tryFilter()
//            .removeDuplicates()
//            .removeDuplicates(by: { int1, int2 in
//                return int1 == int2
//            })
//            .tryRemoveDuplicates(by: { int1, int2 in
//
//            })
//            .replaceNil(with: 0)
//            .replaceEmpty(with: 5)
//            .replaceError(with: "DEFAULT VALUE")
//            .scan(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .scan(0,{ $0 + $1 })
//            .scan(0, + )
//            .tryScan()
//            .reduce(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .reduce(0, +)
//            .collect()
//            .collect(3)
//            .allSatisfy( { $0 < 50 })
//            .tryAllSatisfy()
        */
        
           // Timing Operations
        /* 
//            .debounce(for: 1, scheduler: DispatchQueue.main)
//            .delay(for: 2, scheduler: DispatchQueue.main)
//            .measureInterval(using: DispatchQueue.main)
//            .map( { stride in
//                return "\(stride.timeInterval)"
//            })
//            .throttle(for: 10, scheduler: DispatchQueue.main, latest: false)
//            .retry(3)
//            .timeout(0.75, scheduler: DispatchQueue.main)
         */
        
           // Multiple Publishers / Subscribers
        /*
//            .combineLatest(dataService.boolPublisher, dataService.intPublisher)
//            .compactMap({ (int, bool) in
//                if bool {
//                    return String(int)
//                }
//                return nil
//            })
//            .compactMap({ $1 ? String($0) : nil })
//            .removeDuplicates()
//            .compactMap({ (int1, bool, int2) in
//                if bool {
//                    return String(int1)
//                }
//                return "n/a"
//            })
//            .merge(with: dataService.intPublisher)
//            .zip(dataService.boolPublisher, dataService.intPublisher)
//            .map( { tuple in
//                return String(tuple.0) + tuple.1.description + String(tuple.2)
//            })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return int
//            })
//            .catch({ error in
//                return self.dataService.intPublisher
//            })
        */
        
        
            .map( { String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR: \(error.localizedDescription)"
                }
            } receiveValue: {  [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancelables)

    }
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineBootcamViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
    }
}

struct AdvancedCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootcamp()
    }
}
