using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class Cart
{
    public int CartId { get; set; }
    public int CustomerId { get; set; } // Foreign Key

    // Navigation property
    public Customer Customer { get; set; }
}

}