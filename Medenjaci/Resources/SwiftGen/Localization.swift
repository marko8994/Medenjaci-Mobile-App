// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum Common {
    /// Address
    internal static let address = Strings.tr("Localizable", "Common.Address")
    /// Email
    internal static let email = Strings.tr("Localizable", "Common.Email")
    /// Forgot password?
    internal static let forgotPassword = Strings.tr("Localizable", "Common.ForgotPassword")
    /// Login
    internal static let login = Strings.tr("Localizable", "Common.Login")
    /// Name
    internal static let name = Strings.tr("Localizable", "Common.Name")
    /// Password
    internal static let password = Strings.tr("Localizable", "Common.Password")
    /// Phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Common.PhoneNumber")
    /// Register
    internal static let register = Strings.tr("Localizable", "Common.Register")
    /// Repeat password
    internal static let repeatPassword = Strings.tr("Localizable", "Common.RepeatPassword")
    /// Reset password
    internal static let resetPassword = Strings.tr("Localizable", "Common.ResetPassword")
  }

  internal enum Placeholder {
    /// Enter your address
    internal static let address = Strings.tr("Localizable", "Placeholder.Address")
    /// Enter your email
    internal static let email = Strings.tr("Localizable", "Placeholder.Email")
    /// Enter your name
    internal static let name = Strings.tr("Localizable", "Placeholder.Name")
    /// Enter your password
    internal static let password = Strings.tr("Localizable", "Placeholder.Password")
    /// Enter your phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Placeholder.PhoneNumber")
    /// Repeat your password
    internal static let repeatPassword = Strings.tr("Localizable", "Placeholder.RepeatPassword")
  }

  internal enum Welcome {
    /// Your favorite honey products store
    internal static let description = Strings.tr("Localizable", "Welcome.Description")
    /// Already have an account?
    internal static let existingAccount = Strings.tr("Localizable", "Welcome.ExistingAccount")
    /// Welcome to
    internal static let title = Strings.tr("Localizable", "Welcome.Title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
