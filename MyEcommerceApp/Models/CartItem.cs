using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class CartItem
{
    public int CartItemId { get; set; }
    public int CartId { get; set; } // Foreign Key
    public int ProductId { get; set; } // Foreign Key
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }

    // Navigation properties
    public Cart Cart { get; set; }
    public Product Product { get; set; }
}

}