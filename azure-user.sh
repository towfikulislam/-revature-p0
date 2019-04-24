#!/bin/bash

## verify az

if [ -n $(which az) ]; then 
    echo "azure is exist"
exit 0
fi

##check admin
newuserN=$1
az login -u $newuserN
adminresult=$(az role assignment list --classic-adminstrators --query "[?id=='NA(classic admins)'].principalName" | grep -E /$newuserN)

if [ -z $adminresult ]; then
    echo "not an admin"
exit 1
fi

## doesn't allow create, assign and delete if not admin 

## create user functions

createuser () {
newuserN=$1
password='Welcome@420!'
DOMAIN='tasnimy2gmail.onmicrosoft.com'
userprincipalname=$newuserN@$domain
usersubcription=$2

result=$(az ad user list --query [].userprincipalName | grep -E /$userprincipalname/)

## Only create a user does not exist

if [-z $result ]; then 
    echo "user doesn't exit"
exit 1
fi

if [ -z $result ]; then
    az ad user create --display-name $newuserN --user-principal-name  $userprincipalname --force-change-password-next-login  --password $password --subscription $usersubcription
    echo "newuser created"
fi

}

## assign function to user

assignrole () {

    newuserN=$1
    DOMAIN='tasnimy2gmail.onmicrosoft.com'
    userprincipalname=$newuserN@$domain
    role=$2
    action=$3
    
    result=$(az ad user list --query [].userprincipalName | grep -E /$userprincipalname)
    
    if [ -n $result ]; then
        echo "user exist"
    exit 1
    fi

    if [ $role != "reader"] && [ $role != "contributor"]; then
        echo "assigned role"
    exit 1
    fi

    if [ $action != "create"] && [ $action != "delete"]; then
        echo "Not a valid action"
    exit 1
    fi

    az role assignment $action --assignee $userprincipalname --role $role

        echo "role has assigned"
  
}

## delete user

deleteuser () {
    newuserN=$1
    DOMAIN='tasnimy2gmail.onmicrosoft.com'
    userprincipalname=$newuserN@$domain

    result=(az ad user list --query [].userprincipalName | grep -E /$userprincipalname/)

    if [ -z $result ]; then
        echo "user is not exist"
    exit 1
    fi
    
    if [ -n $result]; then
        az ad user delete --userprincipalname-or-object-id $userprincipalname
        echo "deleted the $newuserN"

}

command=$2
$command $3 $4 $5

exit 0




