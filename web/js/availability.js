        function showTimes(month, date, year) {
                    document.getElementById("timeSlots").style.display = "block";
                    document.getElementById("selectedDate").textContent = month + " " + date + ", " + year;
                }

                function deleteTime(time) {
                    console.log("Deleting time:", time);
                }

                function addTime() {
                    document.getElementById("addTimeForm").style.display = "block";
                }
                function submitTimeForm(event) {
                    event.preventDefault();
                    var startTime = document.getElementById("startTimeInput").value;
                    var endTime = document.getElementById("endTimeInput").value;
                    var timeSlotsBody = document.getElementById("timeSlotsBody");

                    var newRow = document.createElement("tr");
                    var timeCell = document.createElement("td");
                    var statusCell = document.createElement("td");
                    var actionCell = document.createElement("td");
                    var deleteButton = document.createElement("button");

                    timeCell.textContent = startTime + " - " + endTime;
                    statusCell.textContent = "Unbooked";
                    deleteButton.classList.add("btn", "btn-danger");
                    deleteButton.textContent = "Delete";
                    deleteButton.onclick = function () {
                        deleteTime(startTime + " - " + endTime);
                    };

                    actionCell.appendChild(deleteButton);
                    newRow.appendChild(timeCell);
                    newRow.appendChild(statusCell);
                    newRow.appendChild(actionCell);
                    timeSlotsBody.appendChild(newRow);

                    document.getElementById("timeForm").reset();
                    document.getElementById("addTimeForm").style.display = "none";
                }