var TasksData = {

    allModules: [],

    filterdModules: [],

    GetData: function () {


        $.ajax({
            url: `/tasksApi/0/`,
            type: "GET",
            success: function (data) {
                TasksData.allModules = data;
                TasksDraw.DrawDataTable();
                TasksDraw.DrawSelectTasks();
            },
            error: function () {
                alert("Error");
            }
        })
    },

    StartAttack: function (id) {



    }


}

var TasksDraw = {

    DrawDataTable: function () {

        debugger;
        var listItems = '';
        $.each(TasksData.allModules, function (key, value) {
            listItems += `<tr>
                            <td>${value.module_name}</td>
                            <td>${value.module_type}</td>
                            <td>${moment(value.created_date).format('MM/DD/YYYY')}</td>
                          </tr> `;
        });
        $('#bodyData').append(listItems);
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
        });
    },


    DrawSelectTasks: function () {
        var listItems = '<option selected="selected" disabled>choose Task</option>';


        $.each(TasksData.allModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        debugger;
        $("#selectModules").append(listItems);
        //Initialize Select2 Elements

        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })
    },

    ReDrawSelectTasks: function (event) {
        var listItems = '<option selected="selected" disabled>choose Task</option>';
        var type = event.target.value;
        if (type == '0')
            TasksData.filterdModules = TasksData.allModules;
        else if (type == '1')
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 1);
        else if (type == '2')
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 2);
        else
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 3);

        $.each(TasksData.filterdModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        debugger;
        $("#selectModules").html(listItems);

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'success',
            title: 'Tasks Filters Successfully'
        })
    },

    DrawTask: function (event) {
        debugger;
        var id = event.target.value;
        if (id == '1') {

            var html = `  <div class="col-4">
                        <button class="btn btn-info" onclick="TasksData.StartAttack('${id}')">Start Attack</button>
                      </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '2') {

            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartAttack('${id}')">Start Attack</button>
                           </div>`

            $("#ModuleTask").html(html);
        }

    }

}










$(document).ready(function () {
    TasksData.GetData();
});