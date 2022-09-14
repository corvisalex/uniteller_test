@extends('layouts.app-master')

@section('content')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <div class="bg-light p-5 rounded">
        @auth
            <div class="start">
                <script>
                    function buildHtmlTable(selector, myList) {
                        $(selector).html('')
                        var columns = addAllColumnHeaders(myList, selector);

                        for (var i = 0; i < myList.length; i++) {
                            var row$ = $('<tr/>');
                            for (var colIndex = 0; colIndex < columns.length; colIndex++) {
                                var cellValue = myList[i][columns[colIndex]];
                                if (cellValue == null) cellValue = "";
                                row$.append($('<td/>').html(cellValue));
                            }
                            $(selector).append(row$);
                        }
                    }

                    function addAllColumnHeaders(myList, selector) {
                        var columnSet = [];
                        var headerTr$ = $('<tr/>');

                        for (var i = 0; i < myList.length; i++) {
                            var rowHash = myList[i];
                            for (var key in rowHash) {
                                if ($.inArray(key, columnSet) == -1) {
                                    columnSet.push(key);
                                    headerTr$.append($('<th/>').html(key));
                                }
                            }
                        }
                        $(selector).append(headerTr$);

                        return columnSet;
                    }

                    setInterval(function() {
                        $.ajax({
                            url: "/ops",
                            type: 'GET',
                            success: function (res) {
                                var data = JSON.parse(res);
                                buildHtmlTable('#excelDataTable', data)
                            }
                        });
                    }, 2000);

                </script>

                <h1>Привет, <?php echo $data['login']?>!</h1>
                <p class="lead">Ваш баланс:
                    <b><?php foreach ($data['balance'] as $el) echo $el->balance . ' ' . $el->currency . '<br>';?></b>
                </p>
                <table id="excelDataTable" border="1">
                </table>
            </div>
        @endauth

        @guest
            <h1>Homepage</h1>
            <p class="lead">Только авторизованные пользователи имеют доступ в ЛК, пожалуйста зарегистрируйтесь или
                войдите</p>
        @endguest
    </div>
@endsection

<style>
    tbody, td, tfoot, th, thead, tr {
        border: 1px dotted !important;
        font-size: 12px;
        padding: 3px;
    }

    #excelDataTable {
        width: 100%
    }
</style>
