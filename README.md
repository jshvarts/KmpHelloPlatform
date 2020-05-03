# Documentation

The code in this repo follows this [hands-on tutorial from Jetbrains](https://play.kotlinlang.org/hands-on/Targeting%20iOS%20and%20Android%20with%20Kotlin%20Multiplatform/)

When I refer to `<project-root>` below, I am referring to `KmpHelloPlatform/`.
 
Some of the things I changed or made clearer are:
1. Renamed `SharedCode` module to `common`
2. Placed the iOS project code to be distributed together with this repo under `<project-root>/ios` folder.
3. Added more docs on setting up the iOS project with screenshots. Personally I find this to be the most confusing part (partly because I am not an iOS developer).

## iOS Setup

Create an iOS project under `<project-root>/ios`.

### Add Framework

Add Framework by selecting `General tab > Frameworks, Libraries and Embedded Content` 

![Adding Framework](documentation/general-framework-add.png?raw=true)

Once added, it will look similar to this:

![Framework Added](documentation/general-framework-added.png?raw=true)

### Tell XCode where to look for Framework

Select `Build Settings tab > All sub-tab -> Framework Search Paths` to add the following path `$(SRCROOT)/../../common/build/xcode-frameworks`

![Specify Framework Search Path](documentation/framework-search-paths-add.png?raw=true)

Once added, it will look similar to this:

![Framework Search Path Specified](documentation/framework-search-paths-added.png?raw=true)

### Compile common code and generate framework

1. Execute `./gradlew common:build`
2. Execute `./gradlew common:packForXCode`

### Preparing the common framework before each build

Now we need to let Gradle know to prepare common code before each run. To do so, we need to add
`Build Phases tab > Run Script`. If the `Run Script` option does not exist, use the "+" to create it.  

The script to be executed is:
```bash
cd "$SRCROOT/../../common/build/xcode-frameworks"
./gradlew :common:packForXCode -PXCODE_CONFIGURATION=${CONFIGURATION}
```

![Run Script add script](documentation/run-script-pack-for-xcode.png?raw=true)

Once added, it will look similar to this:

![Run Script script added](documentation/run-script-pack-for-xcode-done.png?raw=true)

### On every common code change

For every change in the `common` code, execute `./gradlew common:build` and then run the project in XCode.