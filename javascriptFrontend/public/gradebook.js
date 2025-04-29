function fetchGradeData(){
    //This will query the PostgreSQL database and return grade data
    console.log("Fetching Grade Data...");
// Create a new request for HTTP data
let xhr = new XMLHttpRequest();
// This is the address on the machine we're asking for daata
let apiRoute = "/api/grades";
//When the request changes status, we run this anonymous function
xhr.onreadystatechange -function(){
    let results;
    //check if we're done
    if(xhr.readyState === xhr.DONE){
        // Check if we're succesful
        if(xhr.status !== 200){
            console.error('Could not get grades.')
            Status: ${xhr.status}');
            }
        // And then call the function toi update the HTML with our data
        populateGradebook(JSON.parse(xhr.responseText));
}
}.bind(this);
xhr.open("get", apiRoute, true);
xhr.send();
function populateGradebook(data) {
    //This function will take the fetched grade daa and populate the table
    console.log("Populating Gradebook...", data);
let tableElm = document.getElementById("gradebook"); // Get the gradebook table element
data.forEach(function(assignment){ // foreach row of data we're passed in
    let row = document.createElement("tr"); // Create a table row element
    let columns = []; // Hand place to stick the columns of information
    columns.name = document.createElementNS('td'); // the first column's table data will be the name
    columns.name.appendChild(
        // Concatenate the full name: "last_name, first_name"
        document.createTextNode(assignment.last_name + ", " + assignment.first_name)
    );
    columns.grade = document.createElement('td'); // second column will be the grade
    columns.grade.appendChild(
        //Just put the name in text, you could be fancy and figure out the letter grade here
        //with either a bunch of conditions, or a Javascript "switch" statement
        document.createTextNode(assignment.total_grade)
    );
    //add the table data columns to the table row
    row.appendChild(columns.name)
    row.appendChild(columns.grade);
    // Add the row to the table itself to make the data visible
    tableElm.appendChild(row);
    

//Call the stubs to demonstrate the workflow
const gradeData = fetchGradeData();
populateGradebook(gradeData);
// END Remove