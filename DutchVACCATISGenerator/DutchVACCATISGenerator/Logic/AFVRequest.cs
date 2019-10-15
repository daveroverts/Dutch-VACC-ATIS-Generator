using DutchVACCATISGenerator.Types;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using DutchVACCATISGenerator.Extensions;

namespace DutchVACCATISGenerator.Logic
{
    public class AFVRequest
    {
        private readonly string FileName;
        private readonly string TextRepresentation;

        public AFVRequest(string ehamAtisWavFile, string textRepresentation)
        {
            FileName = ehamAtisWavFile;
            TextRepresentation = textRepresentation;
        }

        public void Send()
        {
            var info = new FileInfo(FileName);
            if (!info.Exists)
            {
                throw new IOException($"Cannot send ATIS file. file {FileName} was not found.");
            }

            using (var file = File.OpenRead(FileName))
            {

            }
        }
    }
}
