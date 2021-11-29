# AP Sub systems

## Uploading
Uploading should support multipart/multiple uploads.
Each uploaded images will be converted as PDFs.

### Image -> PDF -> Job
- ActiveStorage
- Image to PDF
- Multi file uploads
- Max file size upload

##### Encoding Application
Encoding application is a frontend application.
This will be used by encoders to process invoices.

It has the following sub systems:
- Job Pool
- Locked Job Pool (locked to encoder) All locked jobs will be unlocked after an hour.
- PDF navigator
- Encoding forms

##### Sorting Application
Sorting application is a frontend application.
This will be used by encoders to sort invoice images.

It has the following sub systems:
- Uploaded invoice Pool
- PDF navigator
- Encoding forms

##### Rejection Application
Sorting application is a frontend application.
This will be used by AP department to handle rejection.

It has the follwing sub systems:
- Uploaded invoice Pool
- PDF navigator
- Encoding forms

### Encoded invoice jobs -> Payable invoice reports -> client
It is AP department's job to create/verify a report (in XLSX format).
These reports needs to be sent to client's based on their preference.

It has the follwing sub systems:
- Invoice report dashboard
- Invoice search filtered by client/date range/status

#### Weekly
Reports needs to be sent to client on monday and needs to be approved before wednesday.
Total payable approved invoices needs to be paid before friday.
It is AP's department job to follow up, get approval and invoices get paid before friday.

#### Monthly
Reports needs to be sent to client on third week and needs to be approved before end of the week.
Total payable approved invoices needs to be paid before end of the month.
It is AP's department job to follow up, get approval and invoices get paid before end of the month.

### Notes
- All payment's will be done on Wise/Transfer Wise
- Client pays AP and AP will pay client's vendors
- All payments made shall notify client and vendor through push notification, sms, and email

