using #BRAND_NAME#.Xperience.Admin.FormComponents.#COMPONENT_NAME#Component.FormComponents;
using Kentico.Xperience.Admin.Base.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using RegisterFormComponentAttribute = Kentico.Forms.Web.Mvc.RegisterFormComponentAttribute;

[assembly: RegisterFormComponent("#BRAND_NAME#.UIFormComponents.#COMPONENT_NAME#Selector",
                                 typeof(#COMPONENT_NAME#SelectorFormComponent),
                                 "#COMPONENT_DISPLAY_NAME#")]

namespace #BRAND_NAME#.Xperience.Admin.FormComponents.#COMPONENT_NAME#Component.FormComponents
{
    [ComponentAttribute(typeof(#COMPONENT_NAME#SelectorComponentAttribute))]
    public class #COMPONENT_NAME#SelectorFormComponent : FormComponent<#COMPONENT_NAME#ComponentProperties, #COMPONENT_NAME#SelectorFormComponentClientProperties, string>
    {
        // The name of client React component to invoke, without the 'FormComponent' suffix
        public override string ClientComponentName => "@#ORGANIZATION#/#PROJECT_NAME_MODULE#-component/#COMPONENT_NAME#Selector";

        protected override Task ConfigureClientProperties(#COMPONENT_NAME#SelectorFormComponentClientProperties clientProperties)
        {
            base.ConfigureClientProperties(clientProperties);

            // do custom logic with the clientProperties to make it easier to use in the react component
	        // default value can be set with clientProperties.Value

            return Task.CompletedTask;
        }
    }

    // Client properties class
    public class #COMPONENT_NAME#SelectorFormComponentClientProperties : FormComponentClientProperties<string>
    {
        // prop name must match #COMPONENT_NAME#ComponentProperties
    }

    public class #COMPONENT_NAME#ComponentProperties : Kentico.Xperience.Admin.Base.Forms.FormComponentProperties
    {
        // prop name must match #COMPONENT_NAME#SelectorComponentAttribute
    }
}
