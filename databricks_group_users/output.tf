output "user"{
    value = data.azuread_user.current.user_principal_name
}