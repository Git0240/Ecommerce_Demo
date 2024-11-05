using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class Shipping
{
    public int ShippingId { get; set; }
    public int OrderId { get; set; } // Foreign Key
    public string ShippingAddress { get; set; }
    public DateTime ShippingDate { get; set; }
    public string DeliveryStatus { get; set; } // e.g., In Transit, Delivered

    // Navigation property
    public Order Order { get; set; }
}

}