function enableSpinner() {
    spinner.style = '';
    section.style = 'display: none';
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById('form').addEventListener('submit', enableSpinner);
});