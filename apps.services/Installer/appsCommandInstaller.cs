﻿using Castle.Core.Logging;
using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using System.Reflection;
using CastleWindsorFactory.Core;

namespace apps.Services.Installer
{
    public class ClearanceCommandInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            var logger = container.Resolve<ILogger>();
            logger.Info("Started: apps.CommandServices::apps.CommandServices.Installer.apps.CommandServices Install");
            container.Register(
                Classes.FromThisAssembly()
                .BasedOn<ICommand>().WithService.FromInterface()
                    .ConfigureFor<ICommand>(c =>
                    {
                        var attribute = c.Implementation.GetCustomAttribute<CommandAttribute>();
                        var name = attribute != null ? attribute.Name : c.Implementation.Name;
                        var type = typeof(ICommand);
                        c.Named(string.Format("{0}::{1}.{2}", type.Assembly.GetName().Name, type.FullName, name));
                        logger.Info(string.Format("register '{0}' by name '{1}", c.Implementation.FullName, name));
                    }).LifestyleTransient()
            );

            logger.Info("Ended: apps.CommandServices::apps.CommandServices.Installer.apps.CommandServices Install");
        }
    }
}
