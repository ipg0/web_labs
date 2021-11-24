function enableSpinner() {
    spinner.style = '';
    section.style = 'display: none';
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById("submit-btn").addEventListener('click', enableSpinner);
});