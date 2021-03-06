﻿using DutchVACCATISGenerator.Extensions;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;

namespace DutchVACCATISGenerator.Types
{
    public class METAR
    {
        public bool Auto { get; set; }
        public bool CAVOK { get; set; }
        public List<Cloud> Clouds { get; set; }
        public bool Corrected { get; set; }
        public int? DewPoint { get; set; }
        public string ICAO { get; set; }
        public bool NOSIG { get; set; }
        public bool NSC { get; set; }
        public bool NSW { get; set; }
        public List<Phenomena> Phenomena { get; set; }
        public int QNH { get; set; }
        public bool RVR { get; set; }
        public Dictionary<string, int> RVRValues { get; set; }
        public bool SKC { get; set; }
        public int Temperature { get; set; }
        public DateTime Time { get; set; }
        public int? VerticalVisibility { get; set; }
        public int Visibility { get; set; }
        public Wind Wind { get; set; }

        public Trend BECMG { get; set; }
        public Trend TEMPO { get; set; }
        public Trend Military { get; set; }

        public string OriginalMETAR { get; }

        public METAR(string METAR)
        {
            OriginalMETAR = METAR.Trim();

            Phenomena = new List<Phenomena>();
            RVRValues = new Dictionary<string, int>();
            Clouds = new List<Cloud>();

            ParseMetar(OriginalMETAR);
        }

        /// <summary>
        /// Splits and parses the provided METAR.
        /// </summary>
        /// <param name="METAR">METAR</param>
        private void ParseMetar(string METAR)
        {
            var @base = string.Empty;
            var BECMG = string.Empty;
            var military = string.Empty;
            var TEMPO = string.Empty;

            if (METAR.Contains("BECMG") && METAR.Contains("TEMPO"))
            {
                if (METAR.IndexOf("BECMG") < METAR.IndexOf("TEMPO"))
                {
                    @base = METAR.SplitBy("BECMG")[0];
                    BECMG = METAR.SplitBy("BECMG")[1].SplitBy("TEMPO")[0];
                    TEMPO = METAR.SplitBy("TEMPO")[1];
                }
                else
                {
                    @base = METAR.SplitBy("TEMPO")[0];
                    BECMG = METAR.SplitBy("BECMG")[1];
                    TEMPO = METAR.SplitBy("TEMPO")[1].SplitBy("BECMG")[0];
                }
            }
            else if (METAR.Contains("BECMG"))
            {
                @base = METAR.SplitBy("BECMG")[0];
                BECMG = METAR.SplitBy("BECMG")[1];
            }
            else if (METAR.Contains("TEMPO"))
            {
                @base = METAR.SplitBy("TEMPO")[0];
                TEMPO = METAR.SplitBy("TEMPO")[1];
            }
            else
                @base = METAR;

            string[] militaryColors = new String[] { "BLU", "WHT", "GRN", "YLO", "AMB", "RED", "BLACK" };

            var regex = new Regex("(" + string.Join(")|(", militaryColors.Select(w => @"\b" + Regex.Escape(w) + @"\b")) + ")");

            if (regex.IsMatch(@base) && !militaryColors.Any(miltaryColor => @base.EndsWith(miltaryColor)))
            {
                var split = regex.Split(@base);

                @base = split[0].Trim();
                military = split[2].Trim();
            }

            if (string.IsNullOrWhiteSpace(@base))
                throw new ArgumentException("Base part cannot be NULL", nameof(@base));

            ProcessPart(@base.Split(' '), Part.BASE);

            if (!string.IsNullOrWhiteSpace(BECMG))
            {
                this.BECMG = new Trend(Part.BECMG);
                ProcessPart(BECMG.Split(' '), Part.BECMG);
            }

            if (!string.IsNullOrWhiteSpace(TEMPO))
            {
                this.TEMPO = new Trend(Part.TEMPO);
                ProcessPart(TEMPO.Split(' '), Part.TEMPO);
            }

            if (!string.IsNullOrWhiteSpace(military))
            {
                this.Military = new Trend(Part.MILITARY);
                ProcessPart(military.Split(' '), Part.MILITARY);
            }
        }

        /// <summary>
        /// Processes a part of a METAR.
        /// </summary>
        /// <param name="input">Split part of METAR</param>
        /// <param name="part">Part type of split</param>
        private void ProcessPart(string[] input, Part part)
        {
            foreach (var s in input)
            {
                //Only applies to BASE part.
                if (part == Part.BASE)
                {
                    //COR
                    if (s.Equals("COR"))
                    {
                        Corrected = true;
                        continue;
                    }
                        
                    //Auto
                    if (s.Equals("AUTO"))
                    {
                        Auto = true;
                        continue;
                    }
                    
                    //ICAO
                    if (s.All(char.IsLetter) && s.IsLength(4) && (Corrected ? s.Equals(input[1]) : s.Equals(input[0])))
                    {
                        ICAO = s;
                        continue;
                    }

                    //Time
                    if (s.Last().Equals('Z') && s.Length > 6 && s.Substring(0, 6).IsNumbersOnly())
                    {
                        DateTime.TryParseExact(s, "ddHHmmZ", CultureInfo.InvariantCulture, DateTimeStyles.AdjustToUniversal, out DateTime parsedDate);
                        Time = parsedDate;
                        
                        continue;
                    }

                    //Temperature
                    if (ProcessTemperature(s))
                        continue;

                    //QNH
                    if (s.StartsWith("Q") && s.Substring(1).IsNumbersOnly())
                    {
                        QNH = Convert.ToInt32(s.Substring(1));
                        continue;
                    }

                    //NOSIG
                    if (s.Equals("NOSIG"))
                    {
                        NOSIG = true;
                        continue;
                    }
                }

                //Wind
                if (ProcessWind(s, part))
                    continue;

                //Visibility
                if (ProcessVisibility(s, part))
                    continue;

                //RVR
                if (ProcessRVR(s))
                    continue;

                //Phenomena
                if (ProcessPhenomena(s, part))
                    continue;

                //Clouds
                if (ProcessClouds(s, part))
                    continue;
            }
        }

        /// <summary>
        /// Processes wind.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <param name="part"></param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessWind(string input, Part part)
        {
            if (input.StartsWith("VRB"))
            {
                switch (part)
                {
                    case Part.BASE:
                        Wind = new Wind(true, input.Substring(3, 2).ParseInt());
                        break;

                    case Part.BECMG:
                        BECMG.Wind = new Wind(true, input.Substring(3, 2).ParseInt());
                        break;

                    case Part.MILITARY:
                        Military.Wind = new Wind(true, input.Substring(3, 2).ParseInt());
                        break;

                    case Part.TEMPO:
                        TEMPO.Wind = new Wind(true, input.Substring(3, 2).ParseInt());
                        break;
                }

                return true;
            }

            if (input.EndsWith("KT"))
            {
                switch (part)
                {
                    case Part.BASE:
                        Wind = GetWind(input);
                        break;

                    case Part.BECMG:
                        BECMG.Wind = GetWind(input);
                        break;

                    case Part.MILITARY:
                        Military.Wind = GetWind(input);
                        break;

                    case Part.TEMPO:
                        TEMPO.Wind = GetWind(input);
                        break;
                }

                return true;
            }

            if (input.HasVariableWind())
            {
                switch (part)
                {
                    case Part.BASE:
                        Wind = VariableWind(Wind, input);
                        break;

                    case Part.BECMG:
                        BECMG.Wind = VariableWind(Wind, input);
                        break;

                    case Part.MILITARY:
                        Military.Wind = VariableWind(Wind, input);
                        break;

                    case Part.TEMPO:
                        TEMPO.Wind = VariableWind(Wind, input);
                        break;
                }

                return true;
            }

            return false;
        }

        /// <summary>
        /// Processes visibility.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <param name="part">Part type of split</param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessVisibility(string input, Part part)
        {
            if (input.IsNumbersOnly() && (input.IsLength(4) || input.IsLength(3)))
            {
                switch (part)
                {
                    case Part.BASE:
                        Visibility = Convert.ToInt32(input);
                        break;

                    case Part.BECMG:
                        BECMG.Visibility = Convert.ToInt32(input);
                        break;

                    case Part.MILITARY:
                        Military.Visibility = Convert.ToInt32(input);
                        break;

                    case Part.TEMPO:
                        TEMPO.Visibility = Convert.ToInt32(input);
                        break;
                }

                return true;
            }

            if (input.Equals("CAVOK"))
            {
                switch (part)
                {
                    case Part.BASE:
                        CAVOK = true;
                        break;

                    case Part.BECMG:
                        BECMG.CAVOK = true;
                        break;

                    case Part.MILITARY:
                        Military.CAVOK = true;
                        break;

                    case Part.TEMPO:
                        TEMPO.CAVOK = true;
                        break;
                }

                return true;
            }

            if (input.StartsWith("SKC"))
            {
                switch (part)
                {
                    case Part.BASE:
                        SKC = true;
                        break;

                    case Part.BECMG:
                        BECMG.SKC = true;
                        break;

                    case Part.MILITARY:
                        Military.SKC = true;
                        break;

                    case Part.TEMPO:
                        TEMPO.SKC = true;
                        break;
                }

                return true;
            }

            if (input.StartsWith("NSC") || input.StartsWith("NCD"))
            {
                switch (part)
                {
                    case Part.BASE:
                        NSC = true;
                        break;

                    case Part.BECMG:
                        BECMG.NSC = true;
                        break;

                    case Part.MILITARY:
                        Military.NSC = true;
                        break;

                    case Part.TEMPO:
                        TEMPO.NSC = true;
                        break;
                }

                return true;
            }

            if (input.StartsWith("NSW"))
            {
                switch (part)
                {
                    case Part.BASE:
                        NSW = true;
                        break;

                    case Part.BECMG:
                        BECMG.NSW = true;
                        break;

                    case Part.MILITARY:
                        Military.NSW = true;
                        break;

                    case Part.TEMPO:
                        TEMPO.NSW = true;
                        break;
                }

                return true;
            }

            if (input.StartsWith("VV") && input.Substring(2).IsNumbersOnly())
            {
                switch (part)
                {
                    case Part.BASE:
                        VerticalVisibility = Convert.ToInt32(input.Substring(2));
                        break;

                    case Part.BECMG:
                        BECMG.VerticalVisibility = Convert.ToInt32(input.Substring(2));
                        break;

                    case Part.MILITARY:
                        Military.VerticalVisibility = Convert.ToInt32(input.Substring(2));
                        break;

                    case Part.TEMPO:
                        TEMPO.VerticalVisibility = Convert.ToInt32(input.Substring(2));
                        break;
                }

                return true;
            }

            return false;
        }

        /// <summary>
        /// Processes RVR and RVR-values.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessRVR(string input)
        {
            if (input.StartsWith("R") && char.IsNumber(input.ElementAt(1)) && char.IsNumber(input.ElementAt(2)) && !input.Contains("//") && input.Contains("/"))
            {
                RVR = true;

                var split = input.Split(new[] { "/" }, StringSplitOptions.None);

                var regex = new Regex("[^0-9 -]");

                if (split[1].Contains('V'))
                    RVRValues.Add(split[0].Substring(1), Convert.ToInt32(regex.Replace(split[1].Substring(0, split[1].IndexOf('V')), "")));
                else
                    RVRValues.Add(split[0].Substring(1), Convert.ToInt32(regex.Replace(split[1], "")));

                return true;
            }

            return false;
        }

        /// <summary>
        /// Processes phenomena.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <param name="part">Part type of split</param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessPhenomena(string input, Part part)
        {
            var phenomena = new List<string> { "-", "+", "VC", "MI", "PR", "BC", "DR", "BL", "SH", "TS", "FZ", "DZ", "RA", "SN", "SG", "IC", "PL", "GR", "BR", "FG", "FU", "HZ" };

            if (phenomena.Any(p => input.StartsWith(p)))
            {
                if (input.StartsWith("-"))
                {
                    switch (part)
                    {
                        case Part.BASE:
                            Phenomena.Add(new Phenomena(PhenomenaItensity.LIGHT, input.Substring(1)));
                            break;

                        case Part.BECMG:
                            BECMG.Phenomena.Add(new Phenomena(PhenomenaItensity.LIGHT, input.Substring(1)));
                            break;

                        case Part.MILITARY:
                            Military.Phenomena.Add(new Phenomena(PhenomenaItensity.LIGHT, input.Substring(1)));
                            break;

                        case Part.TEMPO:
                            TEMPO.Phenomena.Add(new Phenomena(PhenomenaItensity.LIGHT, input.Substring(1)));
                            break;
                    }

                    return true;
                }
                else if (input.StartsWith("+"))
                {
                    switch (part)
                    {
                        case Part.BASE:
                            Phenomena.Add(new Phenomena(PhenomenaItensity.HEAVY, input.Substring(1)));
                            break;

                        case Part.BECMG:
                            BECMG.Phenomena.Add(new Phenomena(PhenomenaItensity.HEAVY, input.Substring(1)));
                            break;

                        case Part.MILITARY:
                            Military.Phenomena.Add(new Phenomena(PhenomenaItensity.HEAVY, input.Substring(1)));
                            break;

                        case Part.TEMPO:
                            TEMPO.Phenomena.Add(new Phenomena(PhenomenaItensity.HEAVY, input.Substring(1)));
                            break;
                    }

                    return true;
                }
                else
                {
                    switch (part)
                    {
                        case Part.BASE:
                            Phenomena.Add(new Phenomena(PhenomenaItensity.NORMAL, input));
                            break;

                        case Part.BECMG:
                            BECMG.Phenomena.Add(new Phenomena(PhenomenaItensity.NORMAL, input));
                            break;

                        case Part.MILITARY:
                            Military.Phenomena.Add(new Phenomena(PhenomenaItensity.NORMAL, input));
                            break;

                        case Part.TEMPO:
                            TEMPO.Phenomena.Add(new Phenomena(PhenomenaItensity.NORMAL, input));
                            break;
                    }

                    return true;
                }
            }

            return false;
        }

        /// <summary>
        /// Processes clouds.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <param name="part">Part type of split</param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessClouds(string input, Part part)
        {
            var clouds = new List<string> { "FEW", "SCT", "BKN", "OVC" };

            if (clouds.Any(p => input.StartsWith(p)) && input.Length >= 6)
            {
                //Sky obscured
                if (input.Substring(3, 3).All(c => c.Equals('/')))
                {
                    switch (part)
                    {
                        case Part.BASE:
                            Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>()));
                            break;

                        case Part.BECMG:
                            BECMG.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>()));
                            break;

                        case Part.MILITARY:
                            Military.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>()));
                            break;

                        case Part.TEMPO:
                            TEMPO.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>()));
                            break;
                    }
                }
                //Contains addition
                else if (input.Length > 6)
                {
                    //Auto observed.
                    if (input.EndsWith("///"))
                    {
                        switch (part)
                        {
                            case Part.BASE:
                                Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), true));
                                break;

                            case Part.BECMG:
                                BECMG.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), true));
                                break;

                            case Part.MILITARY:
                                Military.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), true));
                                break;

                            case Part.TEMPO:
                                TEMPO.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), true));
                                break;
                        }
                    }
                    else
                    {
                        switch (part)
                        {
                            case Part.BASE:
                                Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), input.Substring(6).ParseEnum<CloudAddition>()));
                                break;

                            case Part.BECMG:
                                BECMG.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), input.Substring(6).ParseEnum<CloudAddition>()));
                                break;

                            case Part.MILITARY:
                                Military.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), input.Substring(6).ParseEnum<CloudAddition>()));
                                break;

                            case Part.TEMPO:
                                TEMPO.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3, 3)), input.Substring(6).ParseEnum<CloudAddition>()));
                                break;
                        }
                    }
                }
                else
                {
                    switch (part)
                    {
                        case Part.BASE:
                            Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3))));
                            break;
                        case Part.BECMG:
                            BECMG.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3))));
                            break;
                        case Part.MILITARY:
                            Military.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3))));
                            break;
                        case Part.TEMPO:
                            TEMPO.Clouds.Add(new Cloud(input.Substring(0, 3).ParseEnum<CloudType>(), Convert.ToInt32(input.Substring(3))));
                            break;
                    }
                }

                return true;
            }

            return false;
        }

        /// <summary>
        /// Processes temperature.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <returns>True if input string has been parsed, else false</returns>
        private bool ProcessTemperature(string input)
        {
            if (input.Contains("/") && (input.Length == 5 || (input.Length == 6 && input.Contains('M')) || (input.Length == 7 && input.Contains('M'))))
            {
                var split = input.Split(new[] { '/' }, 2);

                Temperature = split.First().StartsWith("M") ? split.First().Substring(1, 2).ParseInt() * -1 : split.First().ParseInt();
                DewPoint = split.Last().All(c => c.Equals('/')) ? (int?) null : (split.Last().StartsWith("M") ? split.Last().Substring(1, 2).ParseInt() * -1 : split.Last().ParseInt());

                return true;
            }

            return false;
        }

        /// <summary>
        /// Convert input string to Wind object.
        /// </summary>
        /// <param name="input">Input string</param>
        /// <returns>Wind object</returns>
        private Wind GetWind(string input)
        {
            if (input.Contains("G"))
                return new Wind(input.Substring(0, 3).ParseInt(), input.Substring(3, 2).ParseInt(), input.Substring(6, 2).ParseInt());

            else if ((input.Substring(3, 1)).Equals("0"))
                return new Wind(input.Substring(0, 3).ParseInt(), input.Substring(4, 1).ParseInt());

            else
                return new Wind(input.Substring(0, 3).ParseInt(), input.Substring(3, 2).ParseInt());
        }

        /// <summary>
        /// Sets variable wind of Wind object.
        /// </summary>
        /// <param name="wind">Wind object</param>
        /// <param name="input">Input string</param>
        /// <returns>Wind object with variable wind</returns>
        private Wind VariableWind(Wind wind, string input)
        {
            wind.VariableLeft = input.Substring(0, 3).ParseInt();
            wind.VariableRight = input.Substring(4, 3).ParseInt();

            return wind;
        }
    }

    public enum Part
    {
        BASE,
        BECMG,
        MILITARY,
        TEMPO
    }
}
