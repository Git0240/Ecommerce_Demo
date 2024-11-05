using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class OrderItem
{
    public int OrderItemId { get; set; }
    public int OrderId { get; set; } // Foreign Key
    public int ProductId { get; set; } // Foreign Key
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal TotalPrice { get; set; }

    // Navigation properties
    public Order Order { get; set; }
    public Product Product { get; set; }
}

}