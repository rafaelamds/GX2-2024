document.addEventListener('DOMContentLoaded', function () {
    var filtro = document.getElementById('Categorias');

    filtro.addEventListener('change', function () {
        var selectedOption = document.getElementById('Categorias').value;
        var blogs = document.querySelectorAll('.card-page-item');
        var qtdExibida = 0;

        for (var i = 0; i < blogs.length; i++) {
            var blog = blogs[i];
            var h3 = blog.querySelector('h3').innerText.toLowerCase();

            if (selectedOption === 'todos' || h3.includes(selectedOption)) {
                blog.style.display = 'block';
                qtdExibida++;
            } else {
                blog.style.display = 'none';
            }
        }

        var visibleCards = document.querySelectorAll('.card-page-item[style="display: block;"]');
        for (var j = 0; j < visibleCards.length; j++) {
            visibleCards[j].style.float = 'left';
        }
    });

    filtro.dispatchEvent(new Event('change'));
});
