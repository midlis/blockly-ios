/*
* Copyright 2015 Google Inc. All Rights Reserved.
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
*/

import Foundation

/**
An input field for a checkbox.
*/
@objc(BKYFieldCheckbox)
public final class FieldCheckbox: Field {
  // MARK: - Properties

  public var checked: Bool {
    didSet {
      if !self.editable {
        self.checked = oldValue
      }
      if self.checked != oldValue {
        delegate?.didUpdateField(self)
      }
    }
  }

  // MARK: - Initializers

  public init(name: String, checked: Bool) {
    self.checked = checked

    super.init(name: name)
  }

  // MARK: - Super

  public override func copyField() -> Field {
    return FieldCheckbox(name: name, checked: checked)
  }

  public override func setValueFromSerializedText(text: String) throws {
    self.checked = (text.caseInsensitiveCompare("true") == .OrderedSame)
  }

  public override func serializedText() throws -> String? {
    return self.checked ? "true" : "false"
  }
}
