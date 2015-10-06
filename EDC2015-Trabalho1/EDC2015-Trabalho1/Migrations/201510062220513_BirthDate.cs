namespace EDC2015_Trabalho1.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BirthDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "BirthDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "BirthDate");
        }
    }
}
