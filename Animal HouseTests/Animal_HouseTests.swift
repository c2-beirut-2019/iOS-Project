//
//  Animal_HouseTests.swift
//  Animal HouseTests
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import XCTest
@testable import Animal_House
import Combine

class Animal_HouseTests: XCTestCase {
    
    enum testFailureCondition: Error {
        case anErrorExample
    }

    // example of a functional calling it with a completion closure
    func asyncAPICall(sabotage: Bool, completion completionBlock: @escaping ((Bool, Error?) -> Void)) {
        DispatchQueue.global(qos: .background).async {
            sleep(.random(in: 1...3))
            if sabotage {
                completionBlock(false, testFailureCondition.anErrorExample)
            }
            completionBlock(true, nil)
        }
    }

    func testFuturePublisher() {
        // setup
        var outputValue: Bool = false
        let expectation = XCTestExpectation(description: self.debugDescription)

        // the creating the future publisher
        let sut = Future<Bool, Error> { promise in
            self.asyncAPICall(sabotage: false) { (grantedAccess, err) in
                if let err = err {
                    promise(.failure(err))
                }
                promise(.success(grantedAccess))
            }
        }

        // driving it by attaching it to .sink
        let cancellable = sut.sink(receiveCompletion: { err in
            print(".sink() received the completion: ", String(describing: err))
            expectation.fulfill()
        }, receiveValue: { value in
            print(".sink() received value: ", value)
            outputValue = value
        })
        
//        let dataUpdater = AnySubscriber<Bool, Error>(
//             receiveValue: { [weak self] value -> Subscribers.Demand in
//                print(".sink() received value: ", value)
//                outputValue = value
//                return .max(1)
//             },
//             receiveCompletion: { [weak self] completion in
//                if case let .failure(error) = completion {
//                    print(".sink() received the completion: ", String(describing: error))
//                    expectation.fulfill()
//                }
//             }
//         )
//
//        sut.receive(subscriber: dataUpdater)
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(outputValue)
        XCTAssertNotNil(cancellable)
    }
    
    func testMyTest() {
        let expectation = XCTestExpectation(description: self.debugDescription)

        let sut: Future<NewsListModel, Error> = NetworkManager.sharedInstance.request(endPointType: NewsApi.getNews(paginationURL: "page=\(1)&limit=\(20)"))
        
        let cancellable = sut.sink(receiveCompletion: { err in
            print(".sink() received the completion: ", String(describing: err))

        }, receiveValue: { value in
            print(".sink() received value: ", value)

        })
        
        wait(for: [expectation], timeout: 20)
        XCTAssertNotNil(cancellable)
    }

    func testFuturePublisherShowingFailure() {
        // setup
        let expectation = XCTestExpectation(description: self.debugDescription)

        // the creating the future publisher
        let sut = Future<Bool, Error> { promise in
            self.asyncAPICall(sabotage: true) { (grantedAccess, err) in
                if let err = err {
                    promise(.failure(err))
                }
                promise(.success(grantedAccess))
            }
        }

        // driving it by attaching it to .sink
        let cancellable = sut.sink(receiveCompletion: { err in
            print(".sink() received the completion: ", String(describing: err))
            XCTAssertNotNil(err)
            expectation.fulfill()
        }, receiveValue: { value in
            print(".sink() received value: ", value)
            XCTFail("no value should be returned")
        })

        wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(cancellable)
    }

    func testFutureWithinAFlatMap() {
        let simplePublisher = PassthroughSubject<String, Never>()
        var outputValue: String? = nil

        let cancellable = simplePublisher
            .print(self.debugDescription)
            .flatMap { name in
                return Future<String, Error> { promise in
                    promise(.success(name))
                }.catch { _ in
                    Just("No user found")
                }.map { result in
                    return "\(result) foo"
                }
            }
            .sink(receiveCompletion: { err in
                print(".sink() received the completion", String(describing: err))
            }, receiveValue: { value in
                print(".sink() received \(String(describing: value))")
                outputValue = value
            })

        XCTAssertNil(outputValue)
        simplePublisher.send("one")
        XCTAssertEqual(outputValue, "one foo")
        XCTAssertNotNil(cancellable)
    }
    

}
