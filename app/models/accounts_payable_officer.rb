class AccountsPayableOfficer < User
  default_scope { where(role: :accounts_payable_officer) }
end
