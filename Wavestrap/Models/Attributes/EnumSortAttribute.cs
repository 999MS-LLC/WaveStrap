﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wavestrap.Models.Attributes
{
    class EnumSortAttribute : Attribute
    {
        public int Order { get; set; }
    }
}
