#### This script will generate an empty version of the form control class library.
#### This is not enough; there is an additional step outlined in the README file that must be completed after running the script.
#### If any typos or data invalidation occur, simply rerunning the script will not be enough. The library data should be restored. 
#### We recommend copying these files to a different location and running the script from there. Once the script finishes successfully, only copy the necessary files back
#### to your project. Happy codding :)


Write-Host " `n`nInitial setup of the form control class library."
Write-Host "Before starting, ensure that all necessary data is entered correctly and that no files or folders are locked by any other program... `n"
Write-Host "!IMPORTANT: It is not possible to re-run the script if any data is incorrect. You will need to restore it first.`n" -foreground 'red' 

   
$projectPath = '../project-source/';
$brandName = '#BRAND_NAME#';
$organization = '#ORGANIZATION#';
$componentName = '#COMPONENT_NAME#';
$projectNameModule = '#PROJECT_NAME_MODULE#';
$xperienceVersion = '#XPERIENCE_VERSION#';
$componentDisplayName = '#COMPONENT_DISPLAY_NAME#';
$componentDescription = '#COMPONENT_DESCRIPTION#';
$devPort = '#DEV_PORT#';
$netVersion = '#NET_VERSION#';

$placeholdersDataList = [ordered]@{
	#Brand name, used in namespaces (MyProject)
	$brandName = ''; 
	
	#Same as project name, lowercase without '-' (myproject)
	$organization = ''; 
	
	#Name of the new component you are working on. Don't use 'Selector' suffix (MyCustomTable)
	$componentName = '';
	
	#Same as project name, lowercase and added '-' between camel case, if any. Don't use 'Component' suffix (my-custom-table)
	$projectNameModule = '';
	
	#Xperience By Kentico version (30.0.0)
	$xperienceVersion = '';
	
	#Component display name, visible in admin portal (My Custom Table)
	$componentDisplayName = '';
	
	#Component description, visible in admin portal (My Custom Table is used to show table data...)
	$componentDescription = '';
	
	#Port for the development purpose of your component. Node server will run on that port on local (40009)
	$devPort = '';
	
	#Version of .net of your project (net9.0)
	$netVersion = '';
} 
   
Write-Host "Verify that the following variables are set correctly:" -foreground 'yellow'
Write-Host "`nPROJECT PATH:"  -NoNewLine;
Write-Host (Get-ChildItem $projectPath -file | SELECT -first 1).Directory -foreground 'yellow' "`n"

$validConfiguration = $true;
$placeholdersDataList.GetEnumerator() | ForEach-Object {
	Write-Host "$($_.Name):"  -NoNewLine;
	if($($_.Value) -ne '') {
		Write-Host "$($_.Value)" -foreground 'yellow'
	} else {
		Write-Host "MISSING" -foreground 'red'
		$validConfiguration = $false;
	}
}

if(!$validConfiguration) {
	Write-Host "`nScript execution terminated! All variables MUST be set before running the script again!" -foreground 'red' `n
   exit
}

Write-Host "`nPress ENTER to start with setup or ESC to stop...`n"
$key = [console]::ReadKey()

if ($key.Key -eq '27') {
   Write-Host "Script execution terminated!" -foreground 'red' `n
   exit
}

Write-Host "Start by updating the file and folder names..." -foreground 'yellow'
ForEach ($file in Get-ChildItem $projectPath -recurse | Sort-Object { $_.FullName.Split('\').Length } -descending) {
	$new_name = $file.Name;
	$placeholdersDataList.GetEnumerator() | ForEach-Object {
		$new_name = $new_name -replace $($_.Name), $($_.Value);	
	}
	
	if($file.Name -ne $new_name) {
		Write-Host $new_name
		
		Rename-Item -Path $file.FullName -NewName $new_name
	}
}
Write-Host "File and folder setup is complete...`n" -foreground 'green'

Write-Host "Start by updating the file content..." -foreground 'yellow'
ForEach ($file in Get-ChildItem $projectPath -file -recurse) {
	 $placeholdersDataList.GetEnumerator() | ForEach-Object {
		(Get-Content $file.FullName) -replace $($_.Name), $($_.Value) | Set-Content $file.FullName;
	}
	
	Write-Host $file.Name;
}
Write-Host "File content setup is complete...`n" -foreground 'green'

Write-Host "Please refer to the README file for the next steps..." -foreground 'cyan'
Write-Host "`nThe script has completed successfully" -foreground 'green'


