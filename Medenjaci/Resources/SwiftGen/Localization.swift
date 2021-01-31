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
    /// Amount: %@
    internal static func amount(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.Amount", String(describing: p1))
    }
    /// Cart
    internal static let cart = Strings.tr("Localizable", "Common.Cart")
    /// Date: %@
    internal static func date(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.Date", String(describing: p1))
    }
    /// Delivered
    internal static let delivered = Strings.tr("Localizable", "Common.Delivered")
    /// Email
    internal static let email = Strings.tr("Localizable", "Common.Email")
    /// Forgot password?
    internal static let forgotPassword = Strings.tr("Localizable", "Common.ForgotPassword")
    /// Login
    internal static let login = Strings.tr("Localizable", "Common.Login")
    /// Name
    internal static let name = Strings.tr("Localizable", "Common.Name")
    /// Order
    internal static let order = Strings.tr("Localizable", "Common.Order")
    /// Order notes:
    internal static let orderNotes = Strings.tr("Localizable", "Common.OrderNotes")
    /// Password
    internal static let password = Strings.tr("Localizable", "Common.Password")
    /// Pending
    internal static let pending = Strings.tr("Localizable", "Common.Pending")
    /// Phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Common.PhoneNumber")
    /// Quantity: %d
    internal static func quantity(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.Quantity", p1)
    }
    /// Register
    internal static let register = Strings.tr("Localizable", "Common.Register")
    /// Rejected
    internal static let rejected = Strings.tr("Localizable", "Common.Rejected")
    /// Repeat password
    internal static let repeatPassword = Strings.tr("Localizable", "Common.RepeatPassword")
    /// Reset password
    internal static let resetPassword = Strings.tr("Localizable", "Common.ResetPassword")
    /// Status: %@
    internal static func status(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.Status", String(describing: p1))
    }
    /// Total amount: %@
    internal static func totalAmount(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.TotalAmount", String(describing: p1))
    }
    /// Unit price: %@
    internal static func unitPrice(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.UnitPrice", String(describing: p1))
    }
  }

  internal enum EmptySection {
    /// You have not added anything to your cart. Revisit home page and choose your products.
    internal static let emptyCurrentOrder = Strings.tr("Localizable", "EmptySection.EmptyCurrentOrder")
    /// You don't have old orders.
    internal static let noOlderOrders = Strings.tr("Localizable", "EmptySection.NoOlderOrders")
  }

  internal enum Placeholder {
    /// Enter your address
    internal static let address = Strings.tr("Localizable", "Placeholder.Address")
    /// Enter your email
    internal static let email = Strings.tr("Localizable", "Placeholder.Email")
    /// Enter your name
    internal static let name = Strings.tr("Localizable", "Placeholder.Name")
    /// Enter your order notes
    internal static let orderNotes = Strings.tr("Localizable", "Placeholder.OrderNotes")
    /// Enter your password
    internal static let password = Strings.tr("Localizable", "Placeholder.Password")
    /// Enter your phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Placeholder.PhoneNumber")
    /// Repeat your password
    internal static let repeatPassword = Strings.tr("Localizable", "Placeholder.RepeatPassword")
  }

  internal enum Section {
    /// Current order summary
    internal static let currentOrder = Strings.tr("Localizable", "Section.CurrentOrder")
    /// Previous orders
    internal static let previousOrders = Strings.tr("Localizable", "Section.PreviousOrders")
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
