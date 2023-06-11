function showMessage(message) {
    // Create a div element to display the message
    var popup = $("<div></div>").text(message);

    // Customize the appearance of the pop-up message using CSS
    popup.css({
        position: "fixed",
        top: "50%",
        left: "50%",
        transform: "translate(-50%, -50%)",
        padding: "10px",
        background: "#f1f1f1",
        border: "1px solid #ccc",
        borderRadius: "4px",
        zIndex: "9999"
    });

    // Append the pop-up message to the body of the page
    $("body").append(popup);

    // Remove the pop-up message after a certain duration (e.g., 3 seconds)
    setTimeout(function() {
        popup.remove();
    }, 3000);
}
