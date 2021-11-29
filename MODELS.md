# Database models

### Address (reference table)
address1 String
address2 String
city String
state String
zip_code String
country String

### Phone (reference table)
number String
type [home, office, mobile]

### Email (reference table)
email String
type [business, personal]

### Website (reference table)
url String

### Item (reference table)
name String
description Text

### Companies
name String

### Business
name String
address String
phone String
email String
website String

### Invoice Line Items
String Item
Description Text
Quantity Number
Price Float
Amount Float

### Invoice
belongs_to Client
belongs_to Company
belongs_to Business
has_many invoice_line_items
Sub total Float
Discount Decimal
Total Due Float
Due Date Date
has_many Comments
is_paid Boolean
status Enum(sorted, rejected, encoding, encoded, verifying, verified, approved)
locked_at date
locked_by User

### Comments
belongs_to Polymorphic Association
comment_by User
message Text
created_at

### Payable Invoice Report
Name String(Client Name - date range)
report_date_start Date
report_date_end Date
status Enum(pending, rejected, approved, paid)
has_many Comments
has_many Payable Vendor Report
belongs_to webhook_request


### Payable Vendor Report
belongs_to business
belongs_to Payable Invoice Report
is_paid? Boolean
payable_amount Float
paid_at Date
paid_by User
belongs_to webhook_request

### Webhook Request
body
headers

### User
email String
name String
role Enum(admin/AP/encoder/client)

