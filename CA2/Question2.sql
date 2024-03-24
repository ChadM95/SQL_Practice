ALTER TRIGGER Archive_old_Details ON Vendors
AFTER UPDATE
AS 

BEGIN

    IF UPDATE(DefaultTermsID) OR UPDATE(DefaultAccountNo)
    
    BEGIN

    INSERT INTO VendorDetailsArchive (VendorID, oldTermsID, newTermsID, oldDefaultAccountNo, newDefaultAccountNo, changeDate)
        SELECT d.VendorID, d.DefaultTermsID AS oldTermsID, i.DefaultTermsID AS newTermsID,
            d.DefaultAccountNo AS oldDefaultAccountNo, i.DefaultAccountNo AS newDefaultAccountNo, GETDATE()
        FROM deleted d JOIN inserted i ON d.VendorID = i.VendorID;

    END

END