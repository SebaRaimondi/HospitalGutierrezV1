$('.updateTrigger').click(function () {
    $(function () {
        $("textarea").each(function () {
            this.style.height = (this.scrollHeight+10)+'px';
        });
    });
    $('.input-field').show();
    $('.data').hide();
    $('.updateTrigger').hide();
    $('.updateButton').show();
    Materialize.updateTextFields();
});
$('.backTrigger').click(function () {
    $('.input-field').hide();
    $('.data').show();
    $('.updateTrigger').show();
    $('.updateButton').hide();
    Materialize.updateTextFields();
});