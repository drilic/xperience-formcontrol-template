# xperience-formcontrol-template
The Xperience form control template offers an automated solution to quickly start developing new form controls in Xperience by Kentico. The solution provides a script that modifies all necessary placeholders and configurations required for your new form control class library. In just a few steps, you can create a personalized template for your solution and start building your code.

## Requirements
* **Xperience by Kentico 30.0.0** - It does not work for older versions of Xperience.

## Setup flow
1. Navigate to the _scripts_ folder
1. **It is not possible to proceed with executing the script if any of these are missing. Please review and set all the variables for your project.** Open the script _create-template.ps1_ in your editor and update all the following configuration details in the **$placeholdersDataList**:
    * **#BRAND_NAME#** - Brand name, used in namespaces (MyProject)
    * **#ORGANIZATION#** - Same as project name, lowercase without '-' (myproject)
    * **#COMPONENT_NAME#** - Name of the new component you are working on. Don't use 'Selector' suffix (MyCustomTable)
    * **#PROJECT_NAME_MODULE#** - Same as project name, lowercase and added '-' between camel case, if any. Don't use 'Component' suffix (my-custom-table)
    * **#XPERIENCE_VERSION#** - Xperience By Kentico version (30.0.0)
    * **#COMPONENT_DISPLAY_NAME#** - Component display name, visible in admin portal (My Custom Table)
    * **#COMPONENT_DESCRIPTION#** - Component description, visible in admin portal (My Custom Table is used to show table data...)
    * **#DEV_PORT#** - Port for the development purpose of your component. Node server will run on that port on local (40009)
    * **#NET_VERSION#** - Version of .net of your project (net9.0)
1. Upon successful completion of the script, copy the updated files from _/project-source/src/_ into your project and add it as existing project to your solution.
1. Reference the newly added project to your main project, or to the admin project if it is separated.
1. Rebuild the solution and verify that it builds successfully.
1. Copy the client module settings configuration from _/project-source/appsettings.delete.json_ into the appsettings of the main project. 
1. Here comes the fun part of developing your own component and registering the necessary dependencies, if needed. More about developing custom form components can be found in the [documentation](https://docs.kentico.com/developers-and-admins/development/builders/form-builder/form-components).
1. After that, before building and starting the solution, run the following npm commands:
```bash
# to install all required packages
npm install 

# to build and start server on defined port.
npm run start
```

For higher environments, it is recommended to build the component in _Embedded_ mode. After making this change in the appsettings, you should run the following command:
```bash
npm run build 
```

Upon rebuilding the solution, you are ready to publish it as an embedded resource.


## Contributions and Support
Feel free to fork and submit pull requests or report issues to contribute. Either this way or another one, we will look into them as soon as possible. 