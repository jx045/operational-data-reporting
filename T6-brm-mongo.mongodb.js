// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// Student ID: REDACTED
// Student Name: Ooi Jun Xuan

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
// In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("portfolio_user");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.brm_customer.drop();


// Create collection and insert documents
db.brm_customer.insertMany([
    {"_id":1,"customer_name":"Michael Benjamin","customer_business":"FreshBox","customer_address":"55 Lonsdale Street, Melbourne, 3008","customer_phone":"0478901017","customer_stats":{"number_of_quotes":5,"number_of_jobs":5,"total_paid_jobcost":"$17,400.00","total_unpaid_jobcost":"$4,500.00"},"quotes":[{"quote_no":1,"quote_prepared_on":"02-May-2026","preferred_start_date":"10-May-2026","start_location":"55 Lonsdale Street, Melbourne","end_location":"10 Harbour Road, Sydney","quote_cost":"$4,200.00","assigned_to_job":"Y","job_cost":"$4,200.00"},{"quote_no":2,"quote_prepared_on":"03-May-2026","preferred_start_date":"12-May-2026","start_location":"55 Lonsdale Street, Melbourne","end_location":"21 Station Road, Brisbane","quote_cost":"$3,600.00","assigned_to_job":"Y","job_cost":"$3,900.00"},{"quote_no":3,"quote_prepared_on":"04-May-2026","preferred_start_date":"14-May-2026","start_location":"55 Lonsdale Street, Melbourne","end_location":"45 Rundle Mall, Adelaide","quote_cost":"$4,800.00","assigned_to_job":"Y","job_cost":"$4,500.00"},{"quote_no":4,"quote_prepared_on":"06-May-2026","preferred_start_date":"17-May-2026","start_location":"55 Lonsdale Street, Melbourne","end_location":"38 Wellington Street, Perth","quote_cost":"$5,100.00","assigned_to_job":"Y","job_cost":"$5,100.00"},{"quote_no":5,"quote_prepared_on":"08-May-2026","preferred_start_date":"20-May-2026","start_location":"55 Lonsdale Street, Melbourne","end_location":"13 Industrial Drive, Ballarat","quote_cost":"$3,900.00","assigned_to_job":"Y","job_cost":"$4,200.00"}]},
    {"_id":4,"customer_name":"Alexander Noah","customer_business":"-","customer_address":"56 Bourke Street, Melbourne, 3001","customer_phone":"0478901007","customer_stats":{"number_of_quotes":4,"number_of_jobs":4,"total_paid_jobcost":"$2,900.00","total_unpaid_jobcost":"$1,975.00"},"quotes":[{"quote_no":6,"quote_prepared_on":"11-May-2026","preferred_start_date":"22-May-2026","start_location":"56 Bourke Street, Melbourne","end_location":"72 Cavill Avenue, Brisbane","quote_cost":"$1,200.00","assigned_to_job":"Y","job_cost":"$1,200.00"},{"quote_no":7,"quote_prepared_on":"12-May-2026","preferred_start_date":"24-May-2026","start_location":"56 Bourke Street, Melbourne","end_location":"101 Pitt Street, Sydney","quote_cost":"$950.00","assigned_to_job":"Y","job_cost":"$875.00"},{"quote_no":8,"quote_prepared_on":"14-May-2026","preferred_start_date":"26-May-2026","start_location":"56 Bourke Street, Melbourne","end_location":"23 Murray Street, Perth","quote_cost":"$1,600.00","assigned_to_job":"Y","job_cost":"$1,700.00"},{"quote_no":9,"quote_prepared_on":"16-May-2026","preferred_start_date":"28-May-2026","start_location":"56 Bourke Street, Melbourne","end_location":"92 Oxford Street, Sydney","quote_cost":"$1,100.00","assigned_to_job":"Y","job_cost":"$1,100.00"}]},
    {"_id":5,"customer_name":"Jack Ethan","customer_business":"-","customer_address":"61 Ann Street, Brisbane, 4101","customer_phone":"0434567013","customer_stats":{"number_of_quotes":4,"number_of_jobs":4,"total_paid_jobcost":"$4,250.00","total_unpaid_jobcost":"$3,400.00"},"quotes":[{"quote_no":17,"quote_prepared_on":"01-Jun-2026","preferred_start_date":"14-Jun-2026","start_location":"61 Ann Street, Brisbane","end_location":"45 Rundle Mall, Adelaide","quote_cost":"$1,800.00","assigned_to_job":"Y","job_cost":"$1,950.00"},{"quote_no":18,"quote_prepared_on":"03-Jun-2026","preferred_start_date":"16-Jun-2026","start_location":"61 Ann Street, Brisbane","end_location":"23 Murray Street, Perth","quote_cost":"$2,100.00","assigned_to_job":"Y","job_cost":"$2,000.00"},{"quote_no":19,"quote_prepared_on":"05-Jun-2026","preferred_start_date":"18-Jun-2026","start_location":"61 Ann Street, Brisbane","end_location":"10 Harbour Road, Sydney","quote_cost":"$2,300.00","assigned_to_job":"Y","job_cost":"$2,300.00"},{"quote_no":20,"quote_prepared_on":"07-Jun-2026","preferred_start_date":"20-Jun-2026","start_location":"61 Ann Street, Brisbane","end_location":"55 Lonsdale Street, Melbourne","quote_cost":"$1,500.00","assigned_to_job":"Y","job_cost":"$1,400.00"}]},
    {"_id":8,"customer_name":"Emma","customer_business":"Kreate Curtain","customer_address":"42 Collins Street, Melbourne, 3000","customer_phone":"0423456002","customer_stats":{"number_of_quotes":4,"number_of_jobs":4,"total_paid_jobcost":"$10,500.00","total_unpaid_jobcost":"$2,600.00"},"quotes":[{"quote_no":10,"quote_prepared_on":"18-May-2026","preferred_start_date":"30-May-2026","start_location":"42 Collins Street, Melbourne","end_location":"67 King William Street, Adelaide","quote_cost":"$3,000.00","assigned_to_job":"Y","job_cost":"$3,150.00"},{"quote_no":11,"quote_prepared_on":"20-May-2026","preferred_start_date":"02-Jun-2026","start_location":"42 Collins Street, Melbourne","end_location":"15 George Street, Sydney","quote_cost":"$3,400.00","assigned_to_job":"Y","job_cost":"$3,400.00"},{"quote_no":12,"quote_prepared_on":"22-May-2026","preferred_start_date":"04-Jun-2026","start_location":"42 Collins Street, Melbourne","end_location":"61 Ann Street, Brisbane","quote_cost":"$2,800.00","assigned_to_job":"Y","job_cost":"$2,600.00"},{"quote_no":13,"quote_prepared_on":"24-May-2026","preferred_start_date":"06-Jun-2026","start_location":"42 Collins Street, Melbourne","end_location":"88 Queen Street, Brisbane","quote_cost":"$3,750.00","assigned_to_job":"Y","job_cost":"$3,950.00"}]},
    {"_id":12,"customer_name":"Robert James","customer_business":"Wilson Confectionery","customer_address":"38 Wellington Street, Perth, 6107","customer_phone":"0490123019","customer_stats":{"number_of_quotes":4,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":21,"quote_prepared_on":"09-Jun-2026","preferred_start_date":"23-Jun-2026","start_location":"38 Wellington Street, Perth","end_location":"101 Pitt Street, Sydney","quote_cost":"$700.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":22,"quote_prepared_on":"11-Jun-2026","preferred_start_date":"25-Jun-2026","start_location":"38 Wellington Street, Perth","end_location":"72 Cavill Avenue, Brisbane","quote_cost":"$850.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":23,"quote_prepared_on":"13-Jun-2026","preferred_start_date":"27-Jun-2026","start_location":"38 Wellington Street, Perth","end_location":"94 Henley Beach Road, Adelaide","quote_cost":"$950.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":24,"quote_prepared_on":"15-Jun-2026","preferred_start_date":"29-Jun-2026","start_location":"38 Wellington Street, Perth","end_location":"42 Collins Street, Melbourne","quote_cost":"$1,100.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":16,"customer_name":"Henry Lucas","customer_business":"-","customer_address":"92 Oxford Street, Sydney, 2060","customer_phone":"0412345011","customer_stats":{"number_of_quotes":3,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":25,"quote_prepared_on":"17-Jun-2026","preferred_start_date":"01-Jul-2026","start_location":"92 Oxford Street, Sydney","end_location":"23 Murray Street, Perth","quote_cost":"$2,200.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":26,"quote_prepared_on":"19-Jun-2026","preferred_start_date":"03-Jul-2026","start_location":"92 Oxford Street, Sydney","end_location":"72 Cavill Avenue, Brisbane","quote_cost":"$2,450.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":27,"quote_prepared_on":"21-Jun-2026","preferred_start_date":"05-Jul-2026","start_location":"92 Oxford Street, Sydney","end_location":"55 Lonsdale Street, Melbourne","quote_cost":"$2,600.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":17,"customer_name":"Lily Charlotte","customer_business":"-","customer_address":"18 Chapel Street, Melbourne, 3004","customer_phone":"0423456012","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"$2,300.00","total_unpaid_jobcost":"$1,150.00"},"quotes":[{"quote_no":14,"quote_prepared_on":"26-May-2026","preferred_start_date":"08-Jun-2026","start_location":"18 Chapel Street, Melbourne","end_location":"78 Hay Street, Perth","quote_cost":"$900.00","assigned_to_job":"Y","job_cost":"$900.00"},{"quote_no":15,"quote_prepared_on":"28-May-2026","preferred_start_date":"10-Jun-2026","start_location":"18 Chapel Street, Melbourne","end_location":"83 Jetty Road, Adelaide","quote_cost":"$1,250.00","assigned_to_job":"Y","job_cost":"$1,150.00"},{"quote_no":16,"quote_prepared_on":"30-May-2026","preferred_start_date":"12-Jun-2026","start_location":"18 Chapel Street, Melbourne","end_location":"127 Parramatta Road, Sydney","quote_cost":"$1,400.00","assigned_to_job":"Y","job_cost":"$1,400.00"}]},
    {"_id":18,"customer_name":"Victoria Ella","customer_business":"Flintstone Store","customer_address":"94 Henley Beach Road, Adelaide, 5095","customer_phone":"0401234020","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":300,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"29 Kuranda Road, Adelaide SA 5030","end_location":"9 Albatros Drive, Mount Gambier SA 5270","quote_cost":"$1,000.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":19,"customer_name":"Daniel Mason","customer_business":"-","customer_address":"83 Jetty Road, Adelaide, 5063","customer_phone":"0456789015","customer_stats":{"number_of_quotes":3,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":28,"quote_prepared_on":"23-Jun-2026","preferred_start_date":"07-Jul-2026","start_location":"83 Jetty Road, Adelaide","end_location":"56 Bourke Street, Melbourne","quote_cost":"$1,300.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":29,"quote_prepared_on":"25-Jun-2026","preferred_start_date":"09-Jul-2026","start_location":"83 Jetty Road, Adelaide","end_location":"15 George Street, Sydney","quote_cost":"$1,450.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":30,"quote_prepared_on":"27-Jun-2026","preferred_start_date":"11-Jul-2026","start_location":"83 Jetty Road, Adelaide","end_location":"61 Ann Street, Brisbane","quote_cost":"$1,700.00","assigned_to_job":"N","job_cost":"-"}]}
]);


// List all documents you added
db.brm_customer.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
// Find Melbourne customers who have made at least two quotes.
// Use $and to combine the location and quote-count conditions.
db.brm_customer.find(
    {
        "$and": [
            { "customer_address": /Melbourne/ },
            { "customer_stats.number_of_quotes": { "$gte": 2 } }
        ]
    },
    {
        "_id": 1,
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
db.brm_customer.insertOne(
    {
        "_id": 1001,
        "customer_name": "Patrick Bosse",
        "customer_business": "-",
        "customer_address": "25 Market Street, Melbourne, 3000",
        "customer_phone": "0499001001",
        "customer_stats": {
            "number_of_quotes": 0,
            "number_of_jobs": 0,
            "total_paid_jobcost": "-",
            "total_unpaid_jobcost": "-"
        },
        "quotes": []
    }
);


// Show the customer details
db.brm_customer.find(
    { "_id": 1001 }
);


// (ii) Add new quote
// Add the new quote to Patrick's quotes array.
// Update Patrick's summary statistics after the quote is assigned to a paid job.
db.brm_customer.updateOne(
    { "_id": 1001 },
    {
        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "01-Jul-2026",
                "preferred_start_date": "10-Jul-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            }
        }
    }
);

db.brm_customer.updateOne(
    { "_id": 1001 },
    {
        "$set": {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3,200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        }
    }
);


// Show the customer details
db.brm_customer.find(
    { "_id": 1001 }
);


// End of file - do not remove
