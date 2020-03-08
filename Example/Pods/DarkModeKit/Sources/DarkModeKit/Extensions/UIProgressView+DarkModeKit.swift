//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#if SWIFT_PACKAGE
import DarkModeCore
#endif

extension UIProgressView {
  override func dm_updateDynamicColors() {
    super.dm_updateDynamicColors()

    if let dynamicProgressTintColor = progressTintColor?.copy() as? DynamicColor {
      progressTintColor = dynamicProgressTintColor
    }
    if let dynamicTrackTintColor = trackTintColor?.copy() as? DynamicColor {
      trackTintColor = dynamicTrackTintColor
    }
  }
}
