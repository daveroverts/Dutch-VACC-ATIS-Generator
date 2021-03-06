﻿using System.Diagnostics.CodeAnalysis;

namespace DutchVACCATISGenerator.Types
{
    [ExcludeFromCodeCoverage]
    public class Cloud
    {
        public bool AutoObservation { get; set; }
        public CloudAddition? Addition { get; set; }
        public int Altitude { get; set; }
        public bool SkyObscured  { get; set; }
        public CloudType Type { get; set; }

        /// <summary>
        /// Constructs a Cloud with a type and altitude.
        /// </summary>
        /// <param name="cloudType">Cloud type</param>
        /// <param name="altitude">Altitude</param>
        public Cloud(CloudType cloudType, int altitude)
        {
            Type = cloudType;
            Altitude = altitude;
        }

        /// <summary>
        /// Constructs a Cloud with a type, altitude and addition.
        /// </summary>
        /// <param name="cloudType">Cloud type</param>
        /// <param name="altitude">Altitude</param>
        /// <param name="addition">Addition</param>
        public Cloud(CloudType cloudType, int altitude, CloudAddition addition)
        {
            Type = cloudType;
            Altitude = altitude;
            Addition = addition;
        }

        /// <summary>
        /// Constructs a Cloud with a type, altitude and autoObservation = true.
        /// </summary>
        /// <param name="cloudType"></param>
        /// <param name="altitude"></param>
        /// <param name="autoObservation"></param>
        public Cloud(CloudType cloudType, int altitude, bool autoObservation = true)
        {
            Type = cloudType;
            Altitude = altitude;
            AutoObservation = true;
        }

        /// <summary>
        /// Constructs a Cloud with a type and SkyObscured = true.
        /// </summary>
        /// <param name="cloudType">Cloud type</param>
        public Cloud(CloudType cloudType)
        {
            Type = cloudType;
            SkyObscured = true;
        }
    }

    public enum CloudType
    {
        BKN,
        FEW,
        OVC,
        SCT
    }

    public enum CloudAddition {
        TCU, //Towering Cumulus
        CB, //Cumulonimbus
        CBMAM, //Cumulonimbus mammatus (implying turbulent air in the vicinity)
        ACC, //Alto-cumulus castellatus (medium level vigorous instability)
        CLD //Standing lenticular or rotor clouds.
    }
}
