CREATE PROC getMySales @UserName nvarchar(MAX) 
WITH EXECUTE AS OWNER AS
BEGIN
	SELECT title, ord_num, stor_id, ord_date, qty, payterms 
		FROM authors JOIN titleauthor ON authors.au_id=titleauthor.au_id
					 JOIN sales ON titleauthor.title_id=sales.title_id 
					 JOIN titles ON sales.title_id=titles.title_id 
		WHERE authors.au_fname+' '+authors.au_lname = @UserName;
END
