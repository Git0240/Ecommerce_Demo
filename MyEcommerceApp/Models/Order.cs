using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class Order
{
    public int OrderId { get; set; }
    public int CustomerId { get; set; } // Foreign Key
    public DateTime OrderDate { get; set; }
    public decimal TotalAmount { get; set; }
    public string Status { get; set; } // e.g., Processing, Delivered, Canceled

    // Navigation property
    public Customer Customer { get; set; }
}

}