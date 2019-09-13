using DutchVACCATISGenerator.Extensions;
using System.IO;
using System.Reflection;

namespace DutchVACCATISGenerator.Logic
{
    public interface IFileLogic
    {
        /// <summary>
        /// Deletes the installer files.
        /// </summary>
        /// <param name="removeZips">Remove downloaded zips</param>
        void DeleteOldInstallerFiles();
    }

    public class FileLogic : IFileLogic
    {
        public static readonly string InstallerPath = Path.Combine(Path.GetTempPath(), "DutchVACCATISGenerator");
        public const string InstallerName = @"Dutch VACC ATIS Generator - Setup.exe";

        public static string FullInstallerPathAndName => Path.Combine(InstallerPath, InstallerName);

        public void DeleteOldInstallerFiles()
        {
            if (Directory.Exists(InstallerPath))
            {
                var zips = Directory.GetFiles(InstallerPath, "*.zip");
                foreach (var zip in zips)
                {
                    if (!(new FileInfo(zip).IsLocked()))
                        File.Delete(zip);
                }

                if (File.Exists(FullInstallerPathAndName))
                {
                    File.Delete(FullInstallerPathAndName);
                }
            }
        }
    }
}
