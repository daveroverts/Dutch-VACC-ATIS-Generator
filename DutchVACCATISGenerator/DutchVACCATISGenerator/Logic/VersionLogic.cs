﻿using DutchVACCATISGenerator.Types;
using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Reflection;
using System.Threading.Tasks;

namespace DutchVACCATISGenerator.Logic
{
    public interface IVersionLogic
    {
        Task NewVersion();
    }

    public class VersionLogic : IVersionLogic
    {

        public async Task NewVersion()
        {
            string latestVersion = await LatestVersion();

            //If a latest version has been pulled.
            if (!string.IsNullOrEmpty(latestVersion))
            {
                //If a newer version is available.
                if (!latestVersion.Equals(FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location).FileVersion.Trim()))
                {
                    while (latestVersion.Contains("."))
                        latestVersion = latestVersion.Remove(latestVersion.IndexOf("."), 1);

                    string applicationVersion = FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location).FileVersion.Trim();

                    while (applicationVersion.Contains("."))
                        applicationVersion = applicationVersion.Remove(applicationVersion.IndexOf("."), 1);

                    if (Convert.ToInt32(latestVersion) > Convert.ToInt32(applicationVersion))
                        ApplicationEvents.NewVersion();
                }
            }
        }

        public async Task<string> LatestVersion()
        {
            //Request latest version.
#if DEBUG
            var request = WebRequest.Create($"{ApplicationVariables.UpdateBaseURL}versionTest.txt");
#else
                var request = WebRequest.Create($"{ApplicationVariables.UpdateBaseURL}version.txt");
#endif
            var response = await request.GetResponseAsync();

            //Read latest version.
            var reader = new StreamReader(response.GetResponseStream());

            //Trim latest version string.
            return reader.ReadToEnd().Trim();
        }
    }
}
