using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class User
{
    public int UserId { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; } // Mã hóa
    public string Email { get; set; }
    public string Role { get; set; } // e.g., Admin, Customer
}

}