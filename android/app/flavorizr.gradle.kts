import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.mainkode.luttrell.prod"
            resValue(type = "string", name = "app_name", value = "Production")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.mainkode.luttrell.dev"
            resValue(type = "string", name = "app_name", value = "Development")
        }
        create("stage") {
            dimension = "flavor-type"
            applicationId = "com.mainkode.luttrell.stage"
            resValue(type = "string", name = "app_name", value = "Stage")
        }
    }
}