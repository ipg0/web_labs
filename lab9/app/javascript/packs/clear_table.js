function clearTable() {
    section.style = 'display: none';
}

document.addEventListener('turbolinks:load', () => {
    const clearButton = document.getElementById("clear-btn");
    clearButton.addEventListener('click', (event) => {
        clearTable();
    });
});