using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wavestrap.UI.ViewModels.Settings;

namespace Wavestrap.UI.Elements.Settings.Pages
{
    /// <summary>
    /// Interaction logic for WavestrapPage.xaml
    /// </summary>
    public partial class WavestrapPage
    {
        public WavestrapPage()
        {
            DataContext = new WavestrapViewModel();
            InitializeComponent();
        }
    }
}
