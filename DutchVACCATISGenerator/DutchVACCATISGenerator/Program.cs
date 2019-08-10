using DutchVACCATISGenerator.Extensions;
using DutchVACCATISGenerator.Forms;
using DutchVACCATISGenerator.Properties;
using SimpleInjector;
using System;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Threading;
using System.Windows.Forms;

namespace DutchVACCATISGenerator
{
    [ExcludeFromCodeCoverage]
    static class Program
    {
        private static Container container;

        [STAThread]
        public static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            //Bootstrap SimpleInjector.
            container = container.Bootstrap();

            Application.ThreadException += new ThreadExceptionEventHandler(ThreadExceptionEventHandler);

            if (Debugger.IsAttached)
                Settings.Default.Reset();

            Application.Run(container.GetInstance<MainForm>());
        }

        private static void ThreadExceptionEventHandler(object sender, ThreadExceptionEventArgs e)
        {
            MessageBox.Show("An unexpected error has occurred. The application will now exit.", "Error");

            Application.Exit();
        }
    }
}
