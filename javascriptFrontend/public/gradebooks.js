// TODO: Fetch data from postgreSQL database (to be implemented)
function fetchGradeData(){
    //This will query the database and return grade data
    console.log("Fetching Grade Data...");
}
//TODO: Populate the table with grade data
function populateGradebook(data) {
    //This function will take the fetched grade daa and populate the table
    console.log("Populating Gradebook...", data);
}

//TODO REMOVE THIS
//Call the stubs to demonstrate the workflow
const gradeData = fetchGradeData();
populateGradebook(gradeData);
// END Remove