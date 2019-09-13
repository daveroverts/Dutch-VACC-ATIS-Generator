using DutchVACCATISGenerator.Logic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.IO;
using System.IO.Compression;
using System.Reflection;

namespace DutchVACCATISGenerator.Test.Logic
{
    [TestClass]
    public class FileLogicTests
    {
        private string executablePath;
        private readonly IFileLogic fileLogic;

        public FileLogicTests()
        {
            executablePath = FileLogic.InstallerPath;
            fileLogic = new FileLogic();
        }

        [TestInitialize]
        public void Initialize()
        {
            //Arrange
            Directory.CreateDirectory(executablePath);
            Directory.CreateDirectory(Path.Combine(executablePath, "test"));
            using (var stream = File.Create(Path.Combine(executablePath, "test/test.txt")))
            {
                stream.Close();
            }

            if (!File.Exists(Path.Combine(executablePath, "ziptest.zip")))
            {
                ZipFile.CreateFromDirectory(executablePath + "/test", Path.Combine(executablePath, "ziptest.zip"));
            }
            if (!File.Exists(FileLogic.FullInstallerPathAndName))
            {
                var f = File.Create(FileLogic.FullInstallerPathAndName);
                f.Close();
            }
        }

        [TestMethod]
        public void DeleteInstallerFiles_DeletesFiles_AreDeleted()
        {
            //Act
            fileLogic.DeleteOldInstallerFiles();

            //Assert
            Assert.IsFalse(File.Exists(Path.Combine(executablePath, "ziptest.zip")));
            Assert.IsFalse(File.Exists(FileLogic.FullInstallerPathAndName));
        }
    }
}
