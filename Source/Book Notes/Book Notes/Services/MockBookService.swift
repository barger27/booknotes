//
//  MockBookService.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation
import SwiftDate

class MockBookService : BookServiceProtocol {
    private(set) var searchBookCalls = 0
    
    func searchBook(searchString:String) async throws -> [Book] {
        searchBookCalls += 1
        
        return MockBookService.defaultBooks
    }
    
    
    func saveBook(book: Book) async throws {
        // Do nothing
    }
    
    func loadAllBooks() async throws -> (active: [Book], wishlist: [Book], archived: [Book]) {
        let books = MockBookService.defaultBooks
        
        return (active: books.filter { $0.status == .readList },
                wishlist: books.filter { $0.status == .wishlist },
                archived: books.filter { $0.status == .archived })
    }
    
    
    static var defaultBooks = [
        Book(id: "aVkezgEACAAJ",
             title: "Thinking in SwiftUI",
             description: """
                        SwiftUI is radically different from UIKit. So in this short book, we will
                        help you build a mental model of how SwiftUI works. We explain the most
                        important concepts in detail, and we follow them up with exercises to give
                        you hands-on experience.SwiftUI is still a young framework, and as such, we
                        don't believe it's appropriate to write a complete reference. Instead, this
                        book focuses on transitioning your way of thinking from the object-oriented
                        style of UIKit to the declarative style of SwiftUI.Thinking in SwiftUI is
                        geared toward readers who are familiar with Swift and who have experience
                        building apps in frameworks like UIKit.
                        """,
             authors: [ "Florian Kugler", "Chris Eidhof" ],
             publishedDate: Date(year: 2020, month: 3, day: 16, hour: 0, minute: 0),
             pageCount: 168,
             bookCoverURL: nil,
             bookCoverThumbnail: nil),
        
        Book(id: "t1TbDwAAQBAJ",
             title: "Learn SwiftUI",
             subtitle: "An introductory guide to creating intuitive cross-platform user interfaces using Swift 5",
             description: "An introductory guide to creating intuitive cross-platform user " +
                          "interfaces using Swift 5",
             authors: [ "Chris Barker" ],
             publishedDate: Date(year: 2020, month: 4, day: 3, hour: 0, minute: 0),
             pageCount: 316,
             bookCoverURL: URL(string: "http://books.google.com/books/content?id=t1TbDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
             bookCoverThumbnail: URL(string: "http://books.google.com/books/content?id=t1TbDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")),
        
        Book(id: "hfL0DwAAQBAJ",
             title: "SwiftUI For Dummies",
             description: """
                          The simplest way to create world-class apps Have a unique app idea but
                          worried you don’t quite have the coding skills to build it? Good news:
                          You can stop fretting about someone beating you to market with the same
                          idea and start work right now using SwiftUI. SwiftUI is a gateway app
                          development framework that has become one of the best ways for fledgling
                          developers to get iOS apps off the ground without having to become a
                          coding expert overnight. SwiftUI For Dummies makes that process even
                          faster, providing a friendly introduction to the SwiftUI and Swift
                          programming language and helping you feel right at home creating and
                          building with playgrounds. The book also covers the frameworks and APIs
                          that make it so easy to create smooth, intuitive interfaces—just dive
                          right in and have fun! Combine projects into workspaces Employ Xcode
                          editing tools Use constants and variables Test your code on iOS Simulator
                          Time is of the essence, and with SwiftUI For Dummies, it’s also on your
                          side. Get going with this friendly guide today, and you’ll be celebrating
                          the successful launch of your app way before you thought possible!
                          """,
             authors: [ "Wei-Meng Lee" ],
             publishedDate: Date(year: 2020, month: 9, day: 9, hour: 0, minute: 0),
             pageCount: 416,
             bookCoverURL: URL(string: "http://books.google.com/books/content?id=hfL0DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
             bookCoverThumbnail: URL(string: "http://books.google.com/books/content?id=hfL0DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api")),
        
        Book(id: "hmupzgEACAAJ",
             title: "SwiftUI Cookbook",
             subtitle: "A Best Practice Guide to Solving the Most Common Problems in Using SwiftUI",
             description: """
                          Find practical, logical, and efficient recipes for building cross-platform
                          apps for iOS 15, macOS, and watchOS using Swift 5.5, Xcode 13, and SwiftUI
                          3.0 Key Features: Apply the declarative programming paradigm to build
                          cross-platform UIs for Apple devices Learn to integrate UIkit, Core Data,
                          Firebase, and Sign in with Apple with SwiftUI Adopt the new SwiftUI 3.0
                          features to build visually appealing UIs speedily Book Description:
                          SwiftUI provides an innovative and simple way to build beautiful user
                          interfaces (UIs) for all Apple platforms, from iOS and macOS through to
                          watchOS and tvOS, using the Swift programming language. In this
                          recipe-based cookbook, you'll cover the foundations of SwiftUI as well as
                          the new SwiftUI 3 features introduced in iOS 15 and explore a range of
                          essential techniques and concepts that will help you through the
                          development process. The cookbook begins by explaining how to use basic
                          SwiftUI components. Once you've learned the core concepts of UI
                          development, such as Views, Controls, Lists, and ScrollViews, using
                          practical implementations in Swift, you'll advance to adding useful
                          features to SwiftUI using drawings, built-in shapes, animations, and
                          transitions. You'll understand how to integrate SwiftUI with exciting new
                          components in the Apple development ecosystem, such as Combine for
                          managing events and Core Data for managing app data. Finally, you'll write
                          iOS, macOS, and watchOS apps by sharing the same SwiftUI codebase. By the
                          end of this SwiftUI book, you'll have discovered a range of simple, direct
                          solutions to common problems encountered when building SwiftUI apps. What
                          You Will Learn: Explore various layout presentations in SwiftUI such as
                          HStack, VStack, LazyHStack, and LazyVGrid Create widgets to quickly
                          display relevant content at glance Get up to speed with drawings in
                          SwiftUI using built-in shapes, custom paths, and polygons Discover modern
                          animation and transition techniques in SwiftUI Add user authentication
                          using Firebase and Sign in with Apple Manage concurrency with Combine and
                          async/await in SwiftUI Solve the most common SwiftUI problems, such as
                          integrating a MapKit map, unit testing, snapshot testing, and previewing
                          layouts Who this book is for: This book is for mobile developers who want
                          to learn SwiftUI as well as experienced iOS developers transitioning from
                          UIkit to SwiftUI. The book assumes knowledge of the Swift programming
                          language. Knowledge of object-oriented design and data structures will be
                          useful but not necessary. You'll also find this book to be a helpful
                          resource if you're looking for reference material regarding the
                          implementation of various features in SwiftUI."
                          """,
             authors: [ "Giordano Scalzo", "Edgar Nzokwe" ],
             publishedDate: Date(year: 2021, month: 11, day: 1, hour: 0, minute: 0),
             pageCount: 616,
             bookCoverURL: URL(string: "http://books.google.com/books/content?id=hmupzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"),
             bookCoverThumbnail: URL(string: "http://books.google.com/books/content?id=hmupzgEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")),
        
        Book(id: "mJ1jEAAAQBAJ",
             title: "SwiftUI for Masterminds 2nd Edition 2022",
             subtitle: "How to take advantage of Swift 5.5 and SwiftUI 3 to create insanely great apps for iPhones, iPads, and Macs",
             description: """
                          Learn how to create apps for iOS 15 and macOS Monterey with Swift 5.5 and
                          the SwiftUI 3 framework. SwiftUI for Masterminds is a complete course on
                          how to create professional applications for iPhones, iPads and Mac
                          computers. After reading this book, you will know how to program in Swift,
                          how to design user interfaces with SwiftUI, and how to work with the most
                          powerful frameworks available for app development. In this book we teach
                          you how to build insanely great apps from scratch. Each chapter explores
                          basic and complex concepts; from computer programming and the Swift
                          programming language to database storage, iCloud data sharing, and
                          everything you need to know to develop applications for Apple devices.
                          The information is supported by practical examples that gradually
                          introduce the technologies involved and make them accessible to everyone.
                          SwiftUI for Masterminds was designed to prepare you for the future and was
                          written for the genius in you, for Masterminds. Introduction to Swift 5.5
                          Swift Paradigm Swift Concurrency Declarative User Interfaces SwiftUI
                          Framework Combine Framework Layout and Navigation Scroll Views UIKit in
                          SwiftUI Lists and Grids Maps Graphics and Animations Files Archiving Core
                          Data iCloud CloudKit Camera and Photo Library Video View Web View Gesture
                          Recognizers Drag & Drop Timers Notifications Error Handling ...and more!
                          iOS and Mac development with iOS 15, Xcode 13, Swift 5.5 and SwiftUI 3
                          """,
             authors: [ "J.D Gauchat" ],
             publishedDate: Date(year: 2022, month: 3, day: 10, hour: 0, minute: 0),
             pageCount: 800,
             bookCoverURL: URL(string: "http://books.google.com/books/content?id=mJ1jEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
             bookCoverThumbnail: URL(string: "http://books.google.com/books/content?id=mJ1jEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"))
    ]
}
