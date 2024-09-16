use grocery;
DELIMITER $$

CREATE TRIGGER after_productChanges_update
AFTER UPDATE
ON product FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO productChanges(prod_id,beforeQuantity, afterQuantity)
        VALUES(old.prod_id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;