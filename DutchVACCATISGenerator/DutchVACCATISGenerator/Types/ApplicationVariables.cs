using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

namespace DutchVACCATISGenerator.Types
{
    [ExcludeFromCodeCoverage]
    public class ApplicationVariables
    {
        public const string UpdateBaseURL = @"https://cdn.dutchvacc.nl/atis/";
        public static readonly string ehamSamplesFile = Path.Combine(Application.StartupPath, @"Samples/ehamsamples.txt");
        public static readonly string EhamAtisWavFile = Path.Combine(Application.StartupPath, @"atis.wav");
        public static readonly string SamplesFolder = Path.Combine(Application.StartupPath, @"Samples");


        public int ATISIndex { get; set; }
        public List<string> ATISSamples { get; set; }
        public int FrictionIndex { get; set; }
        public Rectangle MainFormBounds { get; set; }
        public METAR METAR { get; set; }
        public List<string> PhoneticAlphabet { get; set; }
        public string SelectedAirport { get; set; }

        public ApplicationVariables()
        {
            ATISSamples = new List<string>();
            FrictionIndex = 0;
            SelectedAirport = "EHAM";
        }
    }
}
