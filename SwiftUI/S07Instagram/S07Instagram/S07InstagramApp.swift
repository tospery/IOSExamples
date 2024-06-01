//
//  S07InstagramApp.swift
//  S07Instagram
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

@main
struct S07InstagramApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                instaPhotos: [
                    InstaPhoto(
                        id: 0,
                        username: "leavenstee",
                        comments: ["Nice", "Cool","Lame"],
                        likes: 100,
                        image: "wwdc"
                    ),
                    InstaPhoto(
                        id: 0,
                        username: "leavenstee",
                        comments: ["Nice", "Cool","Lame","Nice", "Cool","Lame"],
                        likes: 200,
                        image: "pizza"
                    ),
                    InstaPhoto(
                        id: 0,
                        username: "leavenstee",
                        comments: ["Nice", "Cool","Lame","Nice", "Cool","Lame","Nice", "Cool","Lame","Nice", "Cool","Lame"],
                        likes: 4440,
                        image: "wwdc"
                    ),
                    InstaPhoto(
                        id: 0,
                        username: "leavenstee",
                        comments: ["Nice", "Cool"],
                        likes: 20,
                        image: "badge"
                    )
                ]
            )
        }
    }
}
