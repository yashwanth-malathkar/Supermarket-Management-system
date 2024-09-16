use grocery;
CREATE TABLE productChanges (
    pc_id INT AUTO_INCREMENT PRIMARY KEY,
    prod_id INT not null,
    beforeQuantity INT,
    afterQuantity INT,
    foreign key (prod_id) references product(prod_id) 
);