# Define el ID del grupo de usuarios
$USER_POOL_ID = "us-east-1_xiE7orJcZ"

# Obtener nombres de usuario de users.json
$USERS = (jq -r ".Users[].Username" users.json)

# Iterar a través de los nombres de usuario y eliminarlos
foreach ($USER in $USERS) {
    # Eliminar el usuario con AWS CLI
    aws cognito-idp admin-delete-user --user-pool-id $USER_POOL_ID --username $USER
    Write-Output "Eliminado usuario: $USER"
}

Write-Host "Presiona cualquier tecla para salir..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")