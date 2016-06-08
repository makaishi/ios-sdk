/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import Freddy

public struct Entity: JSONDecodable {
    public let entityID: String
    public let type: String
    public let generic: Bool
    public let entityClass: String
    public let level: String
    public let subtype: String
    public let score: Double
    public let mentions: [ReferencingMentions]
    
    public init(json: JSON) throws {
        entityID = try json.string("eid")
        type = try json.string("type")
        generic = try json.bool("generic")
        entityClass = try json.string("class")
        level = try json.string("level")
        subtype = try json.string("subtype")
        score = try json.double("score")
        mentions = try json.arrayOf("mentref", type: ReferencingMentions.self)
    }
}

public struct ReferencingMentions: JSONDecodable {
    public let mentionID: String
    public let text: String
    
    public init(json: JSON) throws {
        mentionID = try json.string("mid")
        text = try json.string("text")
    }
}
