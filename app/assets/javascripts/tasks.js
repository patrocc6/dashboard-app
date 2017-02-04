function attachDatePicker() {
  $('input.datepicker').datepicker({
      maxViewMode: 2,
      todayBtn: "linked",
      clearBtn: true,
      format: "mm/dd/yyyy"
  });
}
