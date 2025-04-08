using #BRAND_NAME#.Xperience.Admin.FormComponents.#COMPONENT_NAME#Component;

using Kentico.Xperience.Admin.Base;

[assembly: CMS.AssemblyDiscoverable]
[assembly: CMS.RegisterModule(typeof(#COMPONENT_NAME#ComponentModule))]

namespace #BRAND_NAME#.Xperience.Admin.FormComponents.#COMPONENT_NAME#Component
{
    internal class #COMPONENT_NAME#ComponentModule : AdminModule
    {
        public #COMPONENT_NAME#ComponentModule()
            : base("#BRAND_NAME#.FormComponents.Admin.#COMPONENT_NAME#")
        {
        }

        protected override void OnInit()
        {
            base.OnInit();

            // Makes the module accessible to the admin UI
            RegisterClientModule("#ORGANIZATION#", "#PROJECT_NAME_MODULE#-component");
        }
    }
}
