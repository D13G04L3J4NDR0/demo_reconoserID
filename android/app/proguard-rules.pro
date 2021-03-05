# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/hansospina/Software/android-sdk-macosx/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
# The official support library.
-keep class android.support.v4.app.** { *; }
-keep interface android.support.v4.app.** { *; }
-keepattributes Signature
-keepattributes Annotation
-keep class okhttp3.** { *; }
-keep interface okhttp3.* { *; }
-dontwarn okhttp3.*

-keepnames class com.amazonaws.**
# The following are referenced but aren't required to run
#-dontwarn com.fasterxml.jackson.**
#-dontwarn org.apache.commons.logging.**
# Android 6.0 release removes support for the Apache HTTP client
-dontwarn org.apache.http.**
# The SDK has several references of Apache HTTP client
-dontwarn com.amazonaws.http.**
-dontwarn com.amazonaws.metrics.**
# This is a configuration file for ProGuard.
# http://proguard.sourceforge.net/index.html#manual/usage.html

-keep class retrofit.** { *; }
-keep class retrofit.http.** { *; }
-keep class retrofit.client.** { *; }
-keep class com.squareup.okhttp.** { *; }
-keep interface com.squareup.okhttp.** { *; }
-keep class com.google.gson.** { *; }
-keep class com.google.inject.* { *; }
-keep class org.apache.http.* { *; }
-keep class org.codehaus.mojo.** { *; }
-keep class org.apache.james.mime4j.* { *; }
-keep class javax.inject.* { *; }
-keep class sun.misc.Unsafe { *; }
-dontwarn com.squareup.okhttp.**

-dontwarn javax.xml.stream.events.**
-dontwarn rx.**
-dontwarn com.fasterxml.**
-dontwarn okio.**
-dontwarn com.parse.**
-dontwarn com.zendesk.**
-dontwarn retrofit.**
-dontwarn org.apache.lang.**
-dontwarn okio.**
-dontwarn retrofit2.Platform$Java8
-dontwarn com.google.android.gms.**
-dontwarn org.altbeacon.beacon.**
# We only want obfuscation
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes Exceptions
-keepattributes *Annotation*
-keepattributes EnclosingMethod

# Sdk
-keep public interface com.zendesk.** { *; }
-keep public class com.zendesk.** { *; }
-dontwarn java.awt.**

# Appcompat and support
-keep interface android.support.v7.** { *; }
-keep class android.support.v7.** { *; }
-keep interface android.support.v4.** { *; }
-keep class android.support.v4.** { *; }
-dontwarn android.app.Notification

# Gson
-keep interface com.google.gson.** { *; }
-keep class com.google.gson.** { *; }

# Retrofit
-keep class com.google.inject.** { *; }
-keep class org.apache.http.** { *; }
-keep class org.apache.james.mime4j.** { *; }
-keep class javax.inject.** { *; }
-keep class retrofit.** { *; }
-keep interface retrofit.** { *; }
-dontwarn rx.**
-dontwarn com.google.appengine.api.urlfetch.**
-dontwarn okio.**

-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

#Picasso
-dontwarn com.squareup.okhttp.**
#-optimizationpasses 2

# Optimization is turned off by default. Dex does not like code run
# through the ProGuard optimize and preverify steps (and performs some
# of these optimizations on its own).
#-dontoptimize
#-dontpreverify

# If you want to enable optimization, you should include the
# following:
 -optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
 -optimizationpasses 5
#-allowaccessmodification
#
# Note that you cannot just include these flags in your own
# configuration file; if you are including this file, optimization
# will be turned off. You'll need to either edit this file, or
# duplicate the contents of this file and remove the include of this
# file from your project's proguard.config path property.

#-keep public class * extends android.app.Activity
#-keep public class * extends android.app.Application
#-keep public class * extends android.app.Service
#-keep public class * extends android.content.BroadcastReceiver
#-keep public class * extends android.content.ContentProvider
#-keep public class * extends android.app.backup.BackupAgent
#-keep public class * extends android.preference.Preference
#-keep public class * extends android.support.v4.app.Fragment
#-keep public class * extends android.app.Fragment
#-keep public class com.android.vending.licensing.ILicensingService
# For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
-keepclasseswithmembernames class * {
 native <methods>;
}

#-keep public class * extends android.view.View {
# public <init>(android.content.Context);
# public <init>(android.content.Context, android.util.AttributeSet);
# public <init>(android.content.Context, android.util.AttributeSet, int);
# public void set*(...);
#}

#-keepclasseswithmembers class * {
# public <init>(android.content.Context, android.util.AttributeSet);
#}

#-keepclasseswithmembers class * {
# public <init>(android.content.Context, android.util.AttributeSet, int);
#}

#-keepclassmembers class * extends android.app.Activity {
# public void *(android.view.View);
#}

# For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
#-keepclassmembers enum * {
# public static **[] values();
# public static ** valueOf(java.lang.String);
#}

-keep class * implements android.os.Parcelable {
 public static final android.os.Parcelable$Creator *;
}

-keepclassmembers class **.R$* {
 public static <fields>;
}

-dontwarn android.support.**
-dontwarn com.google.ads.**
-dontwarn com.google.common.**