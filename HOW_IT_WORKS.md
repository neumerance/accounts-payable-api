# Account Payable Software

## How it works

AP will received scanned images of invoice from the client.
Scanned invoice needs to be turned as jobs.

Scanned invoice -> Jobs

### Step 1 Sorting
Invoices will be sorted by encoding department, needs to be sorted according to
- vendor
- client
- paid/unpaid
- valid (readable/valid data)
- reject (need rescan/invalid invoice)

Once invoices are sorted.
All valid/paid/unpaid invoices will be converted as jobs will status of `processing`

### Step 2 Encoding 1st Pass
Invoices will be encoded by our Encoding departing first pass encoders
- Company name (vendor)
- Company address (vendor)
- Invoice #
- Invoice Date
- Business Name
- Business Address
- Business Phone (landline)
- Business Phone (mobile)
- Business Email
- Business Website
- Line items
  - Item
  - Description
  - Quantity
  - Price
  - Amount
- Sub total
- Discount (if there's any)
- Total Due
- Due Date
- Comments
  - Name
  - Message
  - Date

### Step 2 Encoding 2nd Pass
All encoded invoices will be verified by 2nd pass encoders.
Once approved, invoices will be set with status of encoded.

### Step 3 Reporting
Every week/months/quarterly (it depends on clients preference).
Client will received a full report of invoices.
Once approved, this invoices will be set as for payment.

### Step 4 Payment
Client will recieved total amount payable with the approved payable envoice reports.
Once paid. AP department will process the payment and pay each of the vendor electronically.
Client will received an email with the receipt of the paid invoices for each vendor.

### Caveats

#### Handling duplicates
During encoding:

As job's invoice number is encoded, AP will check for possible duplicate.
If the data for both invoices do not reconcile, those invoice jobs will be rejected with detailed comments on it.

Encoding department will not send an email to AP department to contact vendor/client to
come up with a solution on how these invoices will be handled.

