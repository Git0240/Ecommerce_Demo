using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class Payment
{
    public int PaymentId { get; set; }
    public int OrderId { get; set; } // Foreign Key
    public DateTime PaymentDate { get; set; }
    public decimal Amount { get; set; }
    public string PaymentMethod { get; set; } // e.g., Credit Card, Cash on Delivery

    // Navigation property
    public Order Order { get; set; }
}

}