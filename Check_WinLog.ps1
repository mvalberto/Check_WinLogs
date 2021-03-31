# Pasar argumentos

Param(
    [Parameter(Mandatory=$false)][string]$fichero,
    [Parameter(Mandatory=$false)][string]$busqueda
    )
	

# Definir codigos de salida

$STATE_OK = 0
$STATE_WARNING = 1
$STATE_CRITICAL = 2
$STATE_UNKNOWN = 3


# Si el fichero no existe Pintar en Nagios Unknown

$FileExists = Test-Path $fichero
if ( $FileExists -ne $True ) {
    echo "El fichero $fichero no existe!"
    exit $STATE_UNKNOWN
    }
# Buscar en el log

$Grep = Get-Content -Path $fichero | Select-String -Pattern $busqueda -CaseSensitive -SimpleMatch

# Contar coincidencias

$Count = ($Grep | Measure-Object).Count

# Si el numero de coincidencias es igual a cero pinta en Nagios OK

if ( $Count -eq 0 ) {
    echo "Sin errores en $fichero"
    exit $STATE_OK
    }

# Si hay coincidencia la pintamos en Nagios Critical

else {
    echo "$Grep"
    exit $STATE_CRITICAL
    }


