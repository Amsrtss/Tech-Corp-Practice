-- Menampilkan 3 pelanggan dengan total belanja tertinggi
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_belanja
FROM Customers AS c
JOIN Orders AS o
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_belanja DESC
LIMIT 3;

-- Menghitung rata-rata nominal pesanan tiap pelanggan (diurutkan dari terbesar)
SELECT c.first_name, c.last_name, ROUND(AVG(o.total_amount),2) AS avg_nominal_pesanan
FROM Customers AS c
JOIN Orders AS o
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY avg_nominal_pesanan DESC;

-- Menampilkan karyawan yang menyelesaikan lebih dari 4 tiket
SELECT e.first_name, e.last_name, SUM(s.status = 'resolved') AS jumlah_tiket_selesai
FROM Employees AS e
JOIN SupportTickets AS s
ON s.employee_id = e.employee_id
GROUP BY e.first_name, e.last_name
HAVING jumlah_tiket_selesai > 4;

-- Menampilkan produk yang belum pernah dipesan 
SELECT p.product_name, p.stock_quantity
FROM Products AS p
LEFT JOIN OrderDetails AS o
ON o.product_id = p.product_id
WHERE o.product_id IS NULL;

-- Menghitung total pendapatan dari seluruh transaksi 
SELECT SUM(total_amount) AS total_pendapatan
FROM Orders;

-- Menghitung total pendapatan berdasarkan detail pesanan
select SUM(quantity*unit_price) AS total_pendapatan
from OrderDetails;

-- Menampilkan kategori produk dengan rata-rata harga di atas 500
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM Products
GROUP BY category
HAVING avg_price > 500;

-- Menampilkan pelanggan dengan transaksi lebih dari 1000
SELECT c.first_name, c.last_name, o.total_amount
FROM Customers AS c
JOIN Orders AS o
ON o.customer_id = c.customer_id
WHERE o.total_amount > 1000;


