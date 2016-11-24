﻿using System.Globalization;

namespace Orckestra.Search.Commands
{
    class PopulateCollectionCommand: IIndexUpdateCommand
    {
        public string Culture { get; set; }

        public void Execute(ISearchIndex index)
        {
            var culture = CultureInfo.GetCultureInfo(Culture);
            index.PopulateCollection(culture);
        }
    }
}
