import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let featureAttribute: Template.Attribute = .optional("feature", default: "Home")
let platformAttribute: Template.Attribute = .optional("platform", default: "ios")
let projectPath = "."
let appPath = "Targets/App"
let targetsPath = "Targets"
let featureFrameworkPath = "Targets/\(featureAttribute)"

private func templatePath(_ path: String) -> Path {
    "templates/\(path)"
}

private func resourcePath(_ path: String) -> Path {
    "resources/\(path)"
}

let template = Template(
    description: "SwiftUI with TCA template",
    attributes: [
        nameAttribute,
        featureAttribute,
        platformAttribute
    ], 
    items: [
        // Tuist
        .file(
            path: "Tuist/ProjectDescriptionHelpers/Project+Templates.swift",
            templatePath: templatePath("Project+Templates.stencil")
        ),
        .file(
            path: projectPath + "/Project.swift",
            templatePath: templatePath("AppProject.stencil")
        ),
        .file(
            path: "Tuist/Config.swift",
            templatePath: templatePath("Config.stencil")
        ),
        .file(
            path: "Tuist/Dependencies.swift",
            templatePath: templatePath("Dependencies.stencil")
        ),
        // App
        .file(
            path: appPath + "/Sources/\(nameAttribute)App.swift",
            templatePath: templatePath("App.stencil")
        ),
        .file(
            path: appPath + "/Tests/AppTests.swift",
            templatePath: templatePath("AppTests.stencil")
        ),
        .directory(
            path: appPath + "/Resources",
            sourcePath: resourcePath("\(platformAttribute)/Assets.xcassets")
        ),
        .directory(
            path: appPath + "/Resources",
            sourcePath: resourcePath("Preview Content")
        ),
        // Feature
        .file(
            path: featureFrameworkPath + "/Sources/\(featureAttribute)View.swift",
            templatePath: templatePath("FeatureView.stencil")
        ),
        .file(
            path: featureFrameworkPath + "/Sources/\(featureAttribute)Reducer.swift",
            templatePath: templatePath("FeatureReducer.stencil")
        ),
        .directory(
            path: featureFrameworkPath,
            sourcePath: resourcePath("Resources")
        ),
        .file(
            path: featureFrameworkPath + "/Tests/Sources/\(featureAttribute)Tests.swift",
            templatePath: templatePath("FeatureTests.stencil")
        ),
        // Services
        .directory(
            path: targetsPath,
            sourcePath: templatePath("Services")
        ),
        // UI
        .directory(
            path: targetsPath,
            sourcePath: templatePath("UI")
        ),
        // Common
        .directory(
            path: targetsPath,
            sourcePath: templatePath("Common")
        ),
        // Configs
        .file(
            path: "Mintfile",
            templatePath: templatePath("Mintfile.stencil")
        ),
        .file(
            path: ".sourcery.yml",
            templatePath: templatePath("Sourcery.stencil")
        ),
        .file(
            path: ".swiftlint.yml",
            templatePath: templatePath("Swiftlint.stencil")
        ),
        .file(
            path: ".gitignore",
            templatePath: templatePath("Gitignore.stencil")
        )
    ]
)
