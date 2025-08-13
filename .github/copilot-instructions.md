# NewBabyApp - iOS Educational App for New Parents

NewBabyApp is an iOS SwiftUI application designed as an educational companion for new parents, covering pregnancy, hospital stay, and home care. The app features tab-based navigation, interactive stories with media content, podcasts, and Czech localization.

**ALWAYS reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the information provided here.**

## Working Effectively

### Environment Requirements
- **macOS with Xcode 14.0+** (iOS app development requires macOS)
- **iOS 16.0+ target deployment** 
- **Swift 5.0+**
- Xcode command line tools installed

**CRITICAL:** This iOS application CANNOT be built or run on Linux environments. All build and test commands require a macOS system with Xcode installed.

### Project Structure Overview
```
NewBabyApp/
├── NewBabyApp.xcodeproj/           # Xcode project file
├── NewBabyApp/                     # Main app source
│   ├── NewBabyAppApp.swift         # App entry point
│   ├── ContentView.swift           # Main tab-based UI
│   ├── MenuView.swift              # Menu navigation
│   ├── OnboardingView.swift        # User onboarding
│   ├── Data/                       # JSON data repositories
│   ├── Models/                     # Swift data models
│   ├── Stories/                    # Story views and media
│   ├── Media/                      # Audio, video, images
│   ├── cs.lproj/                   # Czech localization
│   └── Assets.xcassets/            # App icons and assets
└── localize.py                     # Python localization tool
```

### Development Workflow

**ENVIRONMENT VALIDATION (macOS only):**
```bash
# Verify Xcode installation
xcode-select --version
# Verify iOS simulators available  
xcrun simctl list devices
```

**BUILD PROCESS (macOS only):**
```bash
# Open project in Xcode
open NewBabyApp.xcodeproj
# OR build from command line
xcodebuild -project NewBabyApp.xcodeproj -scheme NewBabyApp -destination 'platform=iOS Simulator,name=iPhone 15' build
```
**NEVER CANCEL:** iOS builds typically take 30-45 seconds for clean builds, up to 2-3 minutes for complete rebuilds. Set timeout to 5+ minutes.

**RUN APPLICATION (macOS only):**
```bash
# Launch in iOS Simulator
xcodebuild -project NewBabyApp.xcodeproj -scheme NewBabyApp -destination 'platform=iOS Simulator,name=iPhone 15' build-for-testing
xcrun simctl install booted path/to/NewBabyApp.app
xcrun simctl launch booted com.yourcompany.NewBabyApp
```

## Code Navigation and Key Components

### Main Architecture
- **ContentView.swift**: Tab-based navigation with 3 main sections:
  1. "Čekáme miminko" (Expecting Baby) - Pregnancy content
  2. "Jsme v porodnici" (At Hospital) - Birth and hospital content  
  3. "Jsme doma" (At Home) - Home care content

- **Data Layer**: JSON-based repositories in `/Data/`:
  - `PregnantRepository.json` - Pregnancy phase content
  - `HospitalRepository.json` - Hospital phase content
  - `HomeRepository.json` - Home care content
  - `LocalRepository.swift` - Data loading logic

- **Models**: Swift data structures in `/Models/`:
  - `MenuModel.swift` - Menu structure definitions
  - `StoriesModel.swift` - Story content structure
  - `PodcastModel.swift` - Podcast functionality

### Content Structure
- **Tab 1 - Pregnancy ("Čekáme miminko")**: Educational content for expectant parents
- **Tab 2 - Hospital ("Jsme v porodnici")**: Birth process and hospital stay guidance  
- **Tab 3 - Home ("Jsme doma")**: Newborn care and home life support

### Media Content Organization
- **Audio Content**: Background-playable podcasts (bonding.mp3, kojeni.mp3, poroddovody.mp3)
- **Story Media**: Interactive stories with images and progress tracking
- **Educational Videos**: Step-by-step instructional content (test-1.mp4, cliptest.mp4)
- **Placeholder Assets**: placeholder.jpg used when media unavailable

### Development Patterns
- **State Management**: Uses `@State`, `@AppStorage`, and `NavigationPath` for navigation
- **Audio Background**: Supports background audio playback with `UIBackgroundModes`
- **Czech-First**: All content authored in Czech, using localization keys pattern

## Development Guidelines

### Code Style and Structure
- Follow SwiftUI patterns and conventions
- Use `@State`, `@AppStorage` for state management appropriately
- Leverage Navigation API for view transitions
- Maintain separation between Views, ViewModels, and Models

### Localization Workflow
- All user-facing text uses `.localizedString` extension
- Update `cs.lproj/Localizable.strings` for new text
- Use `localize.py` script to bulk replace hardcoded strings:
  ```bash
  python3 localize.py ./NewBabyApp/cs.lproj/Localizable.strings './NewBabyApp/**/*.swift'
  ```

### Media Assets
- Audio files: `Media/Podcast/` (MP3 format)  
- Images: `Media/Image/` (organized by content sections)
- Videos: `Media/Video/` (MP4 format)
- Always verify media files load correctly in app

## Manual Validation Requirements

**CRITICAL:** After making code changes, ALWAYS perform these validation steps on macOS with Xcode:

### Essential Testing Scenarios
1. **App Launch**: Verify app starts without crashes and shows onboarding for first-time users
2. **Tab Navigation**: Test all 3 main tabs load correctly with their respective content
3. **Story Playback**: Navigate to Stories section and verify media playback works
4. **Audio Player**: Test background audio continues during navigation
5. **Search Functionality**: Verify search returns relevant results
6. **Localization**: Confirm all text displays in Czech correctly

### Performance Validation  
- Stories should load media within 2-3 seconds
- Tab switching should be immediate
- Audio playback should be smooth without interruption
- Memory usage should remain stable during media playback

## Troubleshooting Common Issues

### Build Errors
- **Missing media files**: Check that all referenced audio/video files exist in Media directories
- **Localization issues**: Verify Localizable.strings is properly formatted UTF-16 
- **Model decoding errors**: Validate JSON structure matches Swift model definitions
- **Known Issue**: `HospitalRepository.json` contains invalid JSON (trailing comma at line 1384) - fix before building

### JSON Data Validation
Always validate JSON files before building:
```bash
# Check all JSON files are valid
for file in NewBabyApp/Data/*.json; do
    python3 -m json.tool "$file" > /dev/null && echo "✓ $file valid" || echo "✗ $file invalid"
done
```

### Runtime Issues  
- **Black screen on launch**: Check ContentView properly loads menu data
- **Media not playing**: Verify iOS simulator audio settings and media file formats
- **Navigation failures**: Ensure NavigationPath state is properly managed

## Quick Validation Commands

**Validate entire project structure (works on any OS with Swift/Python):**
```bash
# Swift syntax validation
find ./NewBabyApp -name "*.swift" -exec swift -frontend -parse {} \;

# JSON data integrity  
for file in NewBabyApp/Data/*.json; do
    python3 -m json.tool "$file" > /dev/null && echo "✓ $(basename $file)" || echo "✗ $(basename $file)"
done

# Localization script test
python3 localize.py --help

# File encoding verification
file NewBabyApp/cs.lproj/Localizable.strings  # Should show UTF-16
```

## Repository Structure (Reference)

```
NewBabyApp/
├── NewBabyApp.xcodeproj/          # Xcode project (46 Swift files total)
├── NewBabyApp/
│   ├── NewBabyAppApp.swift        # App entry point
│   ├── ContentView.swift          # Tab navigation controller  
│   ├── MenuView.swift             # Main menu system
│   ├── OnboardingView.swift       # First-time user flow
│   ├── AudioManager.swift         # Background audio system
│   ├── Utils.swift                # Shared utilities
│   ├── Data/                      # JSON content repositories
│   │   ├── LocalRepository.swift  # Data loading logic
│   │   ├── PregnantRepository.json ✓ Valid JSON
│   │   ├── HospitalRepository.json ✗ Contains JSON error
│   │   └── HomeRepository.json    ✓ Valid JSON  
│   ├── Models/                    # Swift data structures (7 files)
│   ├── Stories/                   # Interactive story system
│   ├── Media/                     # Content assets (89 media files)
│   │   ├── Image/                # Educational images by topic
│   │   ├── Podcast/              # Audio content (MP3)
│   │   └── Video/                # Instructional videos (MP4)
│   ├── MenuItems/                # Menu UI components
│   ├── SubViews/                 # Shared UI components
│   ├── Search/                   # Content search system
│   ├── Extension/                # Swift extensions (4 files)
│   ├── Styles/                   # UI styling definitions
│   ├── cs.lproj/                 # Czech localization (UTF-16)
│   └── Assets.xcassets/          # App icons, colors, images
└── localize.py                   # Localization automation tool
```

## Common Command References

The following are outputs from frequently needed commands to save time:

### Repository Overview
```bash
$ find . -name "*.swift" | wc -l
46

$ ls NewBabyApp/Media/*/  | wc -l  
89

$ python3 localize.py --help
usage: localize.py [-h] strings swift_glob
Bulk replace Swift string literals by .localizedString keys.
```

### Localization Usage Example  
```bash
$ python3 localize.py ./NewBabyApp/cs.lproj/Localizable.strings './NewBabyApp/**/*.swift'
# Processes all Swift files, replacing hardcoded strings with .localizedString calls
```

### When Adding New Features
- **Views**: Place in appropriate subdirectory (Stories/, Search/, etc.)
- **Models**: Add to `/Models/` directory
- **Data**: Update relevant JSON repository file
- **Media**: Place in correct `/Media/` subdirectory
- **Localization**: Add strings to `Localizable.strings`

### Code Review Checklist
- Verify all hardcoded strings are localized
- Check media assets are properly referenced
- Ensure proper error handling for data loading
- Test on both iPhone and iPad simulators
- Validate accessibility compliance

## Limitations in Non-macOS Environments

**WARNING:** The following cannot be validated on Linux/non-macOS systems:
- Building the iOS application  
- Running in iOS Simulator
- Testing actual user interface
- Validating media playback
- Performance testing

**Alternative Actions for Non-macOS:**
- Review code structure and patterns
- Validate Swift syntax: `find . -name "*.swift" -exec swift -frontend -parse {} \;`
- Check JSON data structure validity: `python3 -m json.tool file.json`
- Review localization file formatting
- Analyze project organization and dependencies
- Test localization script: `python3 localize.py --help`

Always ensure testing and validation are completed on a proper macOS development environment before deploying changes.