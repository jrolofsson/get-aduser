
$Users = Get-Content -Path ./test_anvandarnamn.csv | Sort-Object | Get-Unique

foreach ($User in $Users) {
  $U = $User.Split(" ") 

  $X = @{
    Firstname = $U.Get(0)
    Lastname = $U.Get(1)
  }

  $FixedName = $($X.Lastname) + " " + $($X.Firstname)

  Get-ADUser -Filter { displayName -like $FixedName } | Select UserPrincipalName | Export-Csv C:\temp\export2.csv -NoType -Append

}