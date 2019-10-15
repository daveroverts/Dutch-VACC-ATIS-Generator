using DutchVACCATISGenerator.Extensions;
using DutchVACCATISGenerator.Logic;
using DutchVACCATISGenerator.Types;
using System;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace DutchVACCATISGenerator.Forms
{
    [ExcludeFromCodeCoverage]
    public partial class SoundForm : Form
    {
        private readonly ApplicationVariables applicationVariables;
        private readonly ISoundLogic soundLogic;

        public SoundForm(ApplicationVariables applicationVariables, ISoundLogic soundLogic)
        {
            this.applicationVariables = applicationVariables;
            this.soundLogic = soundLogic;

            InitializeComponent();

            //Register application events.
            ApplicationEvents.BuildAITSCompletedEvent += BuildAITSCompleted;
            ApplicationEvents.BuildAITSProgressChangedEvent += BuildAITSProgressChanged;
            ApplicationEvents.BuildAITSStartedEvent += BuildAITSStarted;
            ApplicationEvents.MainFormMovedEvent += MainFormMoved;
            ApplicationEvents.PlaybackStoppedEvent += PlaybackStopped;

            //Enable the build ATIS button if the ATIS has already been generated.
            if (applicationVariables.ATISSamples.Any())
                buildATISButton.Enabled = true;
        }

        #region UI events

        private void Sound_Load(object sender, EventArgs e)
        {
            this.SetRelativeBottom(this.applicationVariables.MainFormBounds);
        }
        #endregion

        #region Application events
        private void BuildATISButton_Click(object sender, EventArgs e)
        {
            buildATISButton.Enabled = false;
            playATISButton.Enabled = false;

            soundLogic.Build(applicationVariables.ATISSamples);
        }

        private void BuildAITSCompleted(object sender, EventArgs e)
        {
            if (buildATISButton.InvokeRequired)
                buildATISButton.Invoke(new Action(() => buildATISButton.Enabled = true));
            else
                buildATISButton.Enabled = true;

            if (playATISButton.InvokeRequired)
                playATISButton.Invoke(new Action(() => playATISButton.Enabled = true));
            else
                playATISButton.Enabled = true;
        }

        private void BuildAITSProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            if (progressBar.InvokeRequired)
                progressBar.Invoke(new Action(() => progressBar.Value = e.ProgressPercentage));
            else
                progressBar.Value = e.ProgressPercentage;
        }

        private void BuildAITSStarted(object sender, EventArgs e)
        {
            if (buildATISButton.InvokeRequired)
                buildATISButton.Invoke(new Action(() => buildATISButton.Enabled = false));
            else
                buildATISButton.Enabled = false;
        }

        private void MainFormMoved(object sender, EventArgs e)
        {
            this.SetRelativeBottom(this.applicationVariables.MainFormBounds);
        }

        private void PlayATISButton_Click(object sender, EventArgs e)
        {
            buildATISButton.Enabled = false;

            playATISButton.Text = "Stop ATIS";

            try
            {
                soundLogic.Play(ApplicationVariables.EhamAtisWavFile);
            }
            catch (FileNotFoundException ex)
            {
                MessageBox.Show(String.Format("Unable to play ATIS. \n\nError: {0}", ex.Message), "Error");

                buildATISButton.Enabled = true;
            }
        }

        private void PlaybackStopped(object sender, EventArgs e)
        {
            //Set play ATIS button text to...
            playATISButton.Text = "Play ATIS";

            buildATISButton.Enabled = true;
        }
        #endregion
    }
}