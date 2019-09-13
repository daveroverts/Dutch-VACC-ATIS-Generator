using DutchVACCATISGenerator.Extensions;
using DutchVACCATISGenerator.Helpers;
using DutchVACCATISGenerator.Types;
using System;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DutchVACCATISGenerator.Logic
{
    public interface IAutoUpdateLogic
    {
        /// <summary>
        /// Download latest version of Dutch VACC ATIS Generator.
        /// </summary>
        Task AutoUpdate();
    }

    public class AutoUpdateLogic : IAutoUpdateLogic
    {
        private readonly IFileLogic fileLogic;
        private string zipName;

        public AutoUpdateLogic(IFileLogic fileLogic)
        {
            this.fileLogic = fileLogic;
        }

        public async Task AutoUpdate()
        {
            await DownloadLatestVersion();
        }

        private async Task DownloadLatestVersion()
        {
            try
            {
                var webClient = new WebClient();

                webClient.DownloadFileCompleted += new AsyncCompletedEventHandler(DownloadFileCompleted);
                webClient.DownloadProgressChanged += new DownloadProgressChangedEventHandler(ApplicationEvents.DownloadProgressChanged);

                zipName = GetZipName();

                //Download the zip file.
                await webClient.DownloadFileTaskAsync(new Uri(ApplicationVariables.UpdateBaseURL + zipName), FileLogic.InstallerPath + zipName);
            }
            catch
            {
                Application.Exit();
            }
        }

        private string GetZipName()
        {
            //Request zip file name.
#if DEBUG
            var request = WebRequest.Create($"{ApplicationVariables.UpdateBaseURL}versionFileTest.txt");
#else
            var request = WebRequest.Create($"{ApplicationVariables.UpdateBaseURL}versionFile.txt");
#endif
            var response = request.GetResponse();

            //Read zip file name.
            return new StreamReader(response.GetResponseStream()).ReadToEnd().Trim();
        }

        private void DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
        {
            try
            {
                //Extract zip.
                using (var zipFile = ZipFile.Open(FileLogic.InstallerPath + zipName, ZipArchiveMode.Read))
                {
                    zipFile.ExtractToDirectory($"{FileLogic.InstallerPath}", true);
                }

                //Delete zip.
                File.Delete(FileLogic.InstallerPath + zipName);

                //Start setup.
                if (!UnitTestHelper.Detect_IsUnitTestRunning())
                    Process.Start(FileLogic.FullInstallerPathAndName);
            }
            finally
            {
                Application.Exit();
            }
        }
    }
}
