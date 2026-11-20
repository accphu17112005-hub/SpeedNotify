#!/usr/bin/env python3
import hashlib
import os

def gen_id(name):
    return hashlib.md5(name.encode('utf-8')).hexdigest()[:24].upper()

sources = [
    ("SpeedNotifyApp.swift", "SpeedNotifyApp.swift", "sourcecode.swift"),
    ("Models/Camera.swift", "Camera.swift", "sourcecode.swift"),
    ("Models/RoadSpeedLimit.swift", "RoadSpeedLimit.swift", "sourcecode.swift"),
    ("Models/TripLocation.swift", "TripLocation.swift", "sourcecode.swift"),
    ("Services/CameraStore.swift", "CameraStore.swift", "sourcecode.swift"),
    ("Services/LocationManager.swift", "LocationManager.swift", "sourcecode.swift"),
    ("Services/OsmCameraSyncService.swift", "OsmCameraSyncService.swift", "sourcecode.swift"),
    ("Services/RoadSpeedLimitService.swift", "RoadSpeedLimitService.swift", "sourcecode.swift"),
    ("Services/TripRecorder.swift", "TripRecorder.swift", "sourcecode.swift"),
    ("Services/VoiceAlertManager.swift", "VoiceAlertManager.swift", "sourcecode.swift"),
    ("Utils/GeoUtils.swift", "GeoUtils.swift", "sourcecode.swift"),
    ("Utils/GpsUtils.swift", "GpsUtils.swift", "sourcecode.swift"),
    ("Views/CameraMapView.swift", "CameraMapView.swift", "sourcecode.swift"),
    ("Views/DashboardView.swift", "DashboardView.swift", "sourcecode.swift"),
    ("Views/MainTabView.swift", "MainTabView.swift", "sourcecode.swift"),
    ("Views/SettingsView.swift", "SettingsView.swift", "sourcecode.swift"),
    ("Views/SpeedLimitSignView.swift", "SpeedLimitSignView.swift", "sourcecode.swift"),
    ("Views/SpeedometerView.swift", "SpeedometerView.swift", "sourcecode.swift"),
    ("Views/TripHistoryView.swift", "TripHistoryView.swift", "sourcecode.swift"),
]

resources = [
    ("Resources/Assets.xcassets", "Assets.xcassets", "folder.assetcatalog"),
    ("Resources/ai_cameras_hanoi.json", "ai_cameras_hanoi.json", "text.json"),
    ("Resources/speed_cameras_vietnam.json", "speed_cameras_vietnam.json", "text.json"),
    ("Resources/warning_camera.wav", "warning_camera.wav", "audio.wav"),
    ("Resources/warning_generic.wav", "warning_generic.wav", "audio.wav"),
    ("Resources/warning_redlight.wav", "warning_redlight.wav", "audio.wav"),
    ("Resources/warning_speed.wav", "warning_speed.wav", "audio.wav"),
]

info_plist = ("Info.plist", "Info.plist", "text.plist.xml")
product = ("SpeedNotify.app", "SpeedNotify.app", "wrapper.application")

# Object IDs
proj_id = gen_id("PROJ_SpeedNotify")
target_id = gen_id("TARGET_SpeedNotify")
main_group_id = gen_id("GROUP_Main")
app_group_id = gen_id("GROUP_SpeedNotify")
models_group_id = gen_id("GROUP_Models")
services_group_id = gen_id("GROUP_Services")
utils_group_id = gen_id("GROUP_Utils")
views_group_id = gen_id("GROUP_Views")
resources_group_id = gen_id("GROUP_Resources")
products_group_id = gen_id("GROUP_Products")

sources_phase_id = gen_id("PHASE_Sources")
resources_phase_id = gen_id("PHASE_Resources")
frameworks_phase_id = gen_id("PHASE_Frameworks")

config_list_proj_id = gen_id("CONFIG_LIST_Project")
config_list_target_id = gen_id("CONFIG_LIST_Target")
config_proj_debug_id = gen_id("CONFIG_Proj_Debug")
config_proj_release_id = gen_id("CONFIG_Proj_Release")
config_target_debug_id = gen_id("CONFIG_Target_Debug")
config_target_release_id = gen_id("CONFIG_Target_Release")

# Generate PBXBuildFile entries
build_files = []
file_refs = []

# File refs for sources
for rel_path, name, ftype in sources:
    file_id = gen_id("FILEREF_" + rel_path)
    build_id = gen_id("BUILDFILE_" + rel_path)
    file_refs.append(f'\t\t{file_id} /* {name} */ = {{isa = PBXFileReference; lastKnownFileType = {ftype}; path = "{os.path.basename(rel_path)}"; sourceTree = "<group>"; }};')
    build_files.append(f'\t\t{build_id} /* {name} in Sources */ = {{isa = PBXBuildFile; fileRef = {file_id} /* {name} */; }};')

# File refs for resources
for rel_path, name, ftype in resources:
    file_id = gen_id("FILEREF_" + rel_path)
    build_id = gen_id("BUILDFILE_" + rel_path)
    file_refs.append(f'\t\t{file_id} /* {name} */ = {{isa = PBXFileReference; lastKnownFileType = {ftype}; path = "{os.path.basename(rel_path)}"; sourceTree = "<group>"; }};')
    build_files.append(f'\t\t{build_id} /* {name} in Resources */ = {{isa = PBXBuildFile; fileRef = {file_id} /* {name} */; }};')

# Info.plist & Product file refs
info_plist_id = gen_id("FILEREF_Info.plist")
file_refs.append(f'\t\t{info_plist_id} /* Info.plist */ = {{isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = "Info.plist"; sourceTree = "<group>"; }};')

product_id = gen_id("FILEREF_Product")
file_refs.append(f'\t\t{product_id} /* SpeedNotify.app */ = {{isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = "SpeedNotify.app"; sourceTree = BUILT_PRODUCTS_DIR; }};')

# Groups
def build_children(items):
    return "\n".join([f'\t\t\t\t{gen_id("FILEREF_" + p)} /* {n} */,' for p, n, _ in items])

models_children = build_children([s for s in sources if s[0].startswith("Models/")])
services_children = build_children([s for s in sources if s[0].startswith("Services/")])
utils_children = build_children([s for s in sources if s[0].startswith("Utils/")])
views_children = build_children([s for s in sources if s[0].startswith("Views/")])
resources_children = build_children(resources)

app_swift_id = gen_id("FILEREF_SpeedNotifyApp.swift")

# Sources build phase list
sources_build_entries = "\n".join([f'\t\t\t\t{gen_id("BUILDFILE_" + s[0])} /* {s[1]} in Sources */,' for s in sources])
resources_build_entries = "\n".join([f'\t\t\t\t{gen_id("BUILDFILE_" + r[0])} /* {r[1]} in Resources */,' for r in resources])

content = f"""// !$*UTF8*$!
{{
	archiveVersion = 1;
	classes = {{
	}};
	objectVersion = 56;
	objects = {{

/* Begin PBXBuildFile section */
{chr(10).join(build_files)}
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
{chr(10).join(file_refs)}
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		{frameworks_phase_id} /* Frameworks */ = {{
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		{main_group_id} = {{
			isa = PBXGroup;
			children = (
				{app_group_id} /* SpeedNotify */,
				{products_group_id} /* Products */,
			);
			sourceTree = "<group>";
		}};
		{products_group_id} /* Products */ = {{
			isa = PBXGroup;
			children = (
				{product_id} /* SpeedNotify.app */,
			);
			name = Products;
			sourceTree = "<group>";
		}};
		{app_group_id} /* SpeedNotify */ = {{
			isa = PBXGroup;
			children = (
				{app_swift_id} /* SpeedNotifyApp.swift */,
				{models_group_id} /* Models */,
				{services_group_id} /* Services */,
				{utils_group_id} /* Utils */,
				{views_group_id} /* Views */,
				{resources_group_id} /* Resources */,
				{info_plist_id} /* Info.plist */,
			);
			path = SpeedNotify;
			sourceTree = "<group>";
		}};
		{models_group_id} /* Models */ = {{
			isa = PBXGroup;
			children = (
{models_children}
			);
			path = Models;
			sourceTree = "<group>";
		}};
		{services_group_id} /* Services */ = {{
			isa = PBXGroup;
			children = (
{services_children}
			);
			path = Services;
			sourceTree = "<group>";
		}};
		{utils_group_id} /* Utils */ = {{
			isa = PBXGroup;
			children = (
{utils_children}
			);
			path = Utils;
			sourceTree = "<group>";
		}};
		{views_group_id} /* Views */ = {{
			isa = PBXGroup;
			children = (
{views_children}
			);
			path = Views;
			sourceTree = "<group>";
		}};
		{resources_group_id} /* Resources */ = {{
			isa = PBXGroup;
			children = (
{resources_children}
			);
			path = Resources;
			sourceTree = "<group>";
		}};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		{target_id} /* SpeedNotify */ = {{
			isa = PBXNativeTarget;
			buildConfigurationList = {config_list_target_id} /* Build configuration list for PBXNativeTarget "SpeedNotify" */;
			buildPhases = (
				{sources_phase_id} /* Sources */,
				{frameworks_phase_id} /* Frameworks */,
				{resources_phase_id} /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = SpeedNotify;
			productName = SpeedNotify;
			productReference = {product_id} /* SpeedNotify.app */;
			productType = "com.apple.product-type.application";
		}};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		{proj_id} /* Project object */ = {{
			isa = PBXProject;
			attributes = {{
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
				TargetAttributes = {{
					{target_id} = {{
						CreatedOnToolsVersion = 15.0;
					}};
				}};
			}};
			buildConfigurationList = {config_list_proj_id} /* Build configuration list for PBXProject "SpeedNotify" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = {main_group_id};
			productRefGroup = {products_group_id} /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				{target_id} /* SpeedNotify */,
			);
		}};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		{resources_phase_id} /* Resources */ = {{
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
{resources_build_entries}
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		{sources_phase_id} /* Sources */ = {{
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
{sources_build_entries}
			);
			runOnlyForDeploymentPostprocessing = 0;
		}};
/* End PBXSourcesBuildPhase section */

/* Begin XCBuildConfiguration section */
		{config_proj_debug_id} /* Debug */ = {{
			isa = XCBuildConfiguration;
			buildSettings = {{
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDEFINED_VARIABLES = YES;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 16.0;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			}};
			name = Debug;
		}};
		{config_proj_release_id} /* Release */ = {{
			isa = XCBuildConfiguration;
			buildSettings = {{
				ALWAYS_SEARCH_USER_PATHS = NO;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDEFINED_VARIABLES = YES;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 16.0;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = "wholemodule";
				SWIFT_OPTIMIZATION_LEVEL = "-O";
				VALIDATE_PRODUCT = YES;
			}};
			name = Release;
		}};
		{config_target_debug_id} /* Debug */ = {{
			isa = XCBuildConfiguration;
			buildSettings = {{
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = NO;
				INFOPLIST_FILE = SpeedNotify/Info.plist;
				INFOPLIST_KEY_CFBundleDisplayName = SpeedNotify;
				INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.navigation";
				IPHONEOS_DEPLOYMENT_TARGET = 16.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.speednotify.ios;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			}};
			name = Debug;
		}};
		{config_target_release_id} /* Release */ = {{
			isa = XCBuildConfiguration;
			buildSettings = {{
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = NO;
				INFOPLIST_FILE = SpeedNotify/Info.plist;
				INFOPLIST_KEY_CFBundleDisplayName = SpeedNotify;
				INFOPLIST_KEY_LSApplicationCategoryType = "public.app-category.navigation";
				IPHONEOS_DEPLOYMENT_TARGET = 16.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.speednotify.ios;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			}};
			name = Release;
		}};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		{config_list_proj_id} /* Build configuration list for PBXProject "SpeedNotify" */ = {{
			isa = XCConfigurationList;
			buildConfigurations = (
				{config_proj_debug_id} /* Debug */,
				{config_proj_release_id} /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		}};
		{config_list_target_id} /* Build configuration list for PBXNativeTarget "SpeedNotify" */ = {{
			isa = XCConfigurationList;
			buildConfigurations = (
				{config_target_debug_id} /* Debug */,
				{config_target_release_id} /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		}};
/* End XCConfigurationList section */
	}};
	rootObject = {proj_id} /* Project object */;
}}
"""

out_path = os.path.join(os.path.dirname(__file__), "..", "ios", "SpeedNotify.xcodeproj", "project.pbxproj")
with open(out_path, "w", encoding="utf-8") as f:
    f.write(content)

print(f"Generated {out_path} successfully!")

