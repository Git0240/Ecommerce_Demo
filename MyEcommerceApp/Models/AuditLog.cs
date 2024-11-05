using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyEcommerceApp.Models
{
    public class AuditLog
{
    public int LogId { get; set; } // Khóa chính
    public int? UserId { get; set; } // Foreign Key (nullable)
    public string Action { get; set; } // e.g., Add, Update, Delete, Login
    public DateTime Timestamp { get; set; }
    public string Details { get; set; } // Mô tả chi tiết về thao tác

    // Navigation property
    public User User { get; set; }
}

}