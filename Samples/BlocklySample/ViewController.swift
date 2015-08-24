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

import UIKit
import Blockly

class ViewController: UIViewController {
  // MARK: - Super

  override func viewDidLoad() {
    super.viewDidLoad()

    let workspace = buildWorkspace()
    let workspaceLayout = LayoutBuilder.buildLayoutTreeFromWorkspace(workspace)
    workspaceLayout.updateLayout()

    let workspaceView = WorkspaceView()
    workspaceView.layout = workspaceLayout
    workspaceView.backgroundColor = UIColor.greenColor()
    workspaceView.translatesAutoresizingMaskIntoConstraints = false
    workspaceView.frame = self.view.bounds
    workspaceView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
    self.view.addSubview(workspaceView)
    self.view.sendSubviewToBack(workspaceView)
    workspaceView.refresh()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: - Private

  func buildWorkspace() -> Workspace {
    let workspace = Workspace(isFlyout: true, isRTL: false)

    let builder = Block.Builder(identifier: "👋🌏", name: "New Kid", workspace: workspace)
    let ifBlock = builder.build()

    let input1 = Input(type: .Value, name: "IF0", sourceBlock: ifBlock)
    input1.connection?.typeChecks = ["Boolean"]
    input1.fields.append(FieldLabel(name: "", text: "if"))

    workspace.blocks.append(ifBlock)

    return workspace
  }
}