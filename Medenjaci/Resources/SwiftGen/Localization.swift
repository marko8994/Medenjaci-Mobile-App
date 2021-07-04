// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum Alert {
    internal enum Title {
      /// Are you sure you want to logut?
      internal static let logoutConfirmation = Strings.tr("Localizable", "Alert.Title.LogoutConfirmation")
    }
  }

  internal enum Common {
    /// Address
    internal static let address = Strings.tr("Localizable", "Common.Address")
    /// Approved
    internal static let approved = Strings.tr("Localizable", "Common.Approved")
    /// Arrival estimate
    internal static let arrivalEstimate = Strings.tr("Localizable", "Common.ArrivalEstimate")
    /// Cancel
    internal static let cancel = Strings.tr("Localizable", "Common.Cancel")
    /// Cart
    internal static let cart = Strings.tr("Localizable", "Common.Cart")
    /// %d$
    internal static func dolarPrice(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.DolarPrice", p1)
    }
    /// Email
    internal static let email = Strings.tr("Localizable", "Common.Email")
    /// Forgot password?
    internal static let forgotPassword = Strings.tr("Localizable", "Common.ForgotPassword")
    /// In %d day
    internal static func inDay(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.InDay", p1)
    }
    /// In %d days
    internal static func inDays(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.InDays", p1)
    }
    /// Order date: %@
    internal static func inlineOrderDate(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.InlineOrderDate", String(describing: p1))
    }
    /// Status: %@
    internal static func inlineStatus(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.InlineStatus", String(describing: p1))
    }
    /// Item amount:
    internal static let itemAmount = Strings.tr("Localizable", "Common.ItemAmount")
    /// Name
    internal static let name = Strings.tr("Localizable", "Common.Name")
    /// New password
    internal static let newPassword = Strings.tr("Localizable", "Common.NewPassword")
    /// OK
    internal static let ok = Strings.tr("Localizable", "Common.Ok")
    /// Order date
    internal static let orderDate = Strings.tr("Localizable", "Common.OrderDate")
    /// Order notes:
    internal static let orderNotes = Strings.tr("Localizable", "Common.OrderNotes")
    /// Password
    internal static let password = Strings.tr("Localizable", "Common.Password")
    /// Pending
    internal static let pending = Strings.tr("Localizable", "Common.Pending")
    /// Phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Common.PhoneNumber")
    /// Price
    internal static let price = Strings.tr("Localizable", "Common.Price")
    /// Quantity: %d
    internal static func quantity(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.Quantity", p1)
    }
    /// Rejected
    internal static let rejected = Strings.tr("Localizable", "Common.Rejected")
    /// Rejection reason
    internal static let rejectionReason = Strings.tr("Localizable", "Common.RejectionReason")
    /// Repeat new password
    internal static let repeatNewPassword = Strings.tr("Localizable", "Common.RepeatNewPassword")
    /// Repeat password
    internal static let repeatPassword = Strings.tr("Localizable", "Common.RepeatPassword")
    /// Status
    internal static let status = Strings.tr("Localizable", "Common.Status")
    /// Total amount: %d$
    internal static func totalAmount(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Common.TotalAmount", p1)
    }
    /// Unit price: %@$
    internal static func unitPrice(_ p1: Any) -> String {
      return Strings.tr("Localizable", "Common.UnitPrice", String(describing: p1))
    }
  }

  internal enum EmptySection {
    /// Cart is empty. Go to home page and add products.
    internal static let emptyCurrentOrder = Strings.tr("Localizable", "EmptySection.EmptyCurrentOrder")
    /// You don't have old orders.
    internal static let noOlderOrders = Strings.tr("Localizable", "EmptySection.NoOlderOrders")
  }

  internal enum Placeholder {
    /// Enter your address
    internal static let address = Strings.tr("Localizable", "Placeholder.Address")
    /// Enter your customer request here
    internal static let customerRequest = Strings.tr("Localizable", "Placeholder.CustomerRequest")
    /// Enter your email
    internal static let email = Strings.tr("Localizable", "Placeholder.Email")
    /// Enter amount your want to order
    internal static let itemAmount = Strings.tr("Localizable", "Placeholder.ItemAmount")
    /// Enter your name
    internal static let name = Strings.tr("Localizable", "Placeholder.Name")
    /// Enter your new password
    internal static let newPassword = Strings.tr("Localizable", "Placeholder.NewPassword")
    /// Enter your order notes
    internal static let orderNotes = Strings.tr("Localizable", "Placeholder.OrderNotes")
    /// Enter your password
    internal static let password = Strings.tr("Localizable", "Placeholder.Password")
    /// Enter your phone number
    internal static let phoneNumber = Strings.tr("Localizable", "Placeholder.PhoneNumber")
    /// Enter your new password again
    internal static let repeatNewPassword = Strings.tr("Localizable", "Placeholder.RepeatNewPassword")
    /// Enter your password again
    internal static let repeatPassword = Strings.tr("Localizable", "Placeholder.RepeatPassword")
  }

  internal enum Section {
    /// Additional info
    internal static let additionalOrderInfo = Strings.tr("Localizable", "Section.AdditionalOrderInfo")
    /// Current order summary
    internal static let currentOrder = Strings.tr("Localizable", "Section.CurrentOrder")
    /// Customer support
    internal static let customerSupport = Strings.tr("Localizable", "Section.CustomerSupport")
    /// Description
    internal static let description = Strings.tr("Localizable", "Section.Description")
    /// Order summary
    internal static let orderSummary = Strings.tr("Localizable", "Section.OrderSummary")
    /// Personal info
    internal static let personalInfo = Strings.tr("Localizable", "Section.PersonalInfo")
    /// Previous orders
    internal static let previousOrders = Strings.tr("Localizable", "Section.PreviousOrders")
    /// Usage directions
    internal static let usageDirections = Strings.tr("Localizable", "Section.UsageDirections")
  }

  internal enum Title {
    /// Add to cart
    internal static let addToCart = Strings.tr("Localizable", "Title.AddToCart")
    /// Change password
    internal static let changePassword = Strings.tr("Localizable", "Title.ChangePassword")
    /// Change personal info
    internal static let changePersonalInfo = Strings.tr("Localizable", "Title.ChangePersonalInfo")
    /// Login
    internal static let login = Strings.tr("Localizable", "Title.Login")
    /// Logut
    internal static let logut = Strings.tr("Localizable", "Title.Logut")
    /// Order
    internal static let order = Strings.tr("Localizable", "Title.Order")
    /// Order details
    internal static let orderDetails = Strings.tr("Localizable", "Title.OrderDetails")
    /// Profile
    internal static let profile = Strings.tr("Localizable", "Title.Profile")
    /// Register
    internal static let register = Strings.tr("Localizable", "Title.Register")
    /// Reset password
    internal static let resetPassword = Strings.tr("Localizable", "Title.ResetPassword")
    /// Send request
    internal static let sendRequest = Strings.tr("Localizable", "Title.SendRequest")
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
