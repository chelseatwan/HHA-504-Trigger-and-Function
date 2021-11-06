delimiter $$
CREATE TRIGGER ChelseaT_lowDiastolic BEFORE INSERT ON clinical_data
FOR EACH ROW
BEGIN
	IF NEW.diastolic <= 30 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Diastolic BP must be above 30 mg!';
	END IF;
END; $$
delimiter ;

delimiter $$
CREATE FUNCTION ProcedureBaseCost(cost DECIMAL(10,2))
RETURNS VARCHAR(20)
BEGIN
	DECLARE procedureBaseCost VARCHAR(20);
    IF base_cost > 2000 THEN
		SET procedureBaseCost = 'expensive';
	ELSEIF cost < 2000 THEN
		SET procedureBaseCost = 'not_expensive';
        END IF;
    RETURN (procedureBaseCost);
END
$$
DELIMITER ;