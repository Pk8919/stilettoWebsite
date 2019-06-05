// --------------------------------------------------------------------------------
// Copyright AspDotNetStorefront.com. All Rights Reserved.
// http://www.aspdotnetstorefront.com
// For details on this license please visit the product homepage at the URL above.
// THE ABOVE NOTICE MUST REMAIN INTACT. 
// --------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vortx.OnePageCheckout.Models;
using Vortx.OnePageCheckout.Views;
using Vortx.OnePageCheckout.Settings;

namespace Vortx.OnePageCheckout
{
	public class ObjectFactory
	{
		public static IModelFactory CreateModelFactory()
		{
			string modelAssembly = AspDotNetStorefrontCore.AppLogic.AppConfig("Vortx.OnePageCheckout.ModelFactoryAssembly");
			string modelType = AspDotNetStorefrontCore.AppLogic.AppConfig("Vortx.OnePageCheckout.ModelFactoryType");

			System.Runtime.Remoting.ObjectHandle handle = System.Activator.CreateInstance(modelAssembly, modelType);
			return (IModelFactory)handle.Unwrap();
		}

		public static IConfigurationProviderFactory CreateConfigurationFactory()
		{
			string modelAssembly = AspDotNetStorefrontCore.AppLogic.AppConfig("Vortx.OnePageCheckout.ConfigurationFactoryAssembly");
			string modelType = AspDotNetStorefrontCore.AppLogic.AppConfig("Vortx.OnePageCheckout.ConfigurationFactoryType");

			System.Runtime.Remoting.ObjectHandle handle = System.Activator.CreateInstance(modelAssembly, modelType);
			return (IConfigurationProviderFactory)handle.Unwrap();
		}
	}
}
