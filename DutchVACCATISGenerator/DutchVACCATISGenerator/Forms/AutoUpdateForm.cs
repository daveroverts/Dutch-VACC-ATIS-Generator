using DutchVACCATISGenerator.Logic;
using DutchVACCATISGenerator.Types;
using System;
using System.Diagnostics.CodeAnalysis;
using System.Net;
using System.Windows.Forms;

namespace DutchVACCATISGenerator.Forms
{
    [ExcludeFromCodeCoverage]
    public partial class AutoUpdaterForm : Form
    {
        public AutoUpdaterForm(IAutoUpdateLogic autoUpdateLogic)
        {
            InitializeComponent();

            ApplicationEvents.DownloadProgressChangedEvent += DownloadProgressChanged;

            try
            {
                autoUpdateLogic.AutoUpdate();
            }
            catch
            {
                this.Close();
            }
        }

        private void DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
            if (progressBar.InvokeRequired)
                progressBar.Invoke(new Action(() => progressBar.Value = e.ProgressPercentage));
            else
                progressBar.Value = e.ProgressPercentage;
        }
    }
}

