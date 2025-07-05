use EcommerceDB;
CREATE PROCEDURE AddOrderSimple (
    IN input_CustomerID INT,
    IN input_OrderDate DATE
)

SELECT COUNT(*) INTO @exists
FROM Customers
WHERE CustomerID = 1;


INSERT INTO Orders (CustomerID, OrderDate)
SELECT 1, '2025-07-06'
FROM dual
WHERE @exists > 0;


SELECT
  CASE
    WHEN @exists > 0 THEN 'Order added successfully.'
    ELSE 'Customer does not exist.'
  END AS Message;
  
DELIMITER //

CREATE FUNCTION HasOrdersSimple (input_CustomerID INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE order_count INT;

    SELECT COUNT(*) INTO order_count
    FROM Orders
    WHERE CustomerID = input_CustomerID;

    RETURN IF(order_count > 0, 1, 0);
END //

DELIMITER ;

SELECT HasOrdersSimple(1);




