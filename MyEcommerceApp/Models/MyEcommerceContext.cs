using Microsoft.EntityFrameworkCore;
using MyEcommerceApp.Models;

namespace MyEcommerceApp.Models
{
    public class MyEcommerceContext : DbContext
    {
        public MyEcommerceContext(DbContextOptions<MyEcommerceContext> options) : base(options) { }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<Shipping> Shippings { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditLog>()
                .HasKey(a => a.LogId); // Đảm bảo LogId được định nghĩa là khóa chính

            // Cấu hình cho các model khác nếu cần
        }
    }

}
