var Helper = {
    AjaxCall: function (url, paramters, callingType, returnFormat, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            dataType: returnFormat,
            success: function (data) {
                success(data);
                return data;
            },
            error: function () {
                falier();
                $('#info').html('<p>An error has occurred</p>');
                return 0;
            },
            type: callingType
        });
    },
    AjaxCallPost: function (url, paramters, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                success(data);
                return data;
            },
            error: function (xhr, err) {
                debugger;
                //alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
                //alert("responseText: " + xhr.responseText);
                falier();
                $('#info').html('<p>An error has occurred</p>');
                return 0;
            },
            type: 'POST'
        });
    },
    AjaxCallPut: function (url, paramters, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                success(data);
                return data;
            },
            error: function (xhr, err) {
                //alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
                //alert("responseText: " + xhr.responseText);
                falier();
                $('#info').html('<p>An error has occurred</p>');
                return 0;
            },
            type: 'PUT'
        });
    },
    AjaxCallGet: function (url, paramters, returnFormat, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            contentType: "application/json; charset=utf-8",
            dataType: returnFormat,
            success: function (data) {
                success(data);
                return data;
            },
            //error: function () {
            //    falier();
            //    $('#info').html('<p>An error has occurred</p>');
            //    return 0;
            //},
            error: function (xhr, status, error) {
                var errorMessage = xhr.status + ': ' + xhr.statusText + ': ' + xhr.responseText + ': ';
                console.log('Error - ' + errorMessage);
            },
            type: 'GET',

        });
    },
    AjaxCallDelete: function (url, paramters, returnFormat, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            contentType: "application/json; charset=utf-8",
            dataType: returnFormat,
            success: function (data) {
                success(data);
                return true;
            },
            //error: function () {
            //    falier();
            //    $('#info').html('<p>An error has occurred</p>');
            //    return 0;
            //},
            error: function (xhr, status, error) {
                var errorMessage = xhr.status + ': ' + xhr.statusText + ': ' + xhr.responseText + ': ';
                console.log('Error - ' + errorMessage);
                return false;
            },
            type: 'Delete',

        });
    },
    AjaxCallGetSync: function (url, paramters, returnFormat, success, falier) {
        $.ajax({
            url: url,
            data: paramters,
            contentType: "application/json; charset=utf-8",
            dataType: returnFormat,
            success: function (data) {
                success(data);
                return data;
            },
            error: function () {
                falier();
                $('#info').html('<p>An error has occurred</p>');
                return 0;
            },
            type: 'GET',
            async: false
        });
    },
    ClosePopUp: function () {
        parent.jQuery.colorbox.close();
    },
    CallingServer: function (expretion, data) {
        __doPostBack('__Page', expretion + "_" + data);
    },
    //ClosePopUp: function () {
    //    parent.jQuery.colorbox.close();
    //},
    BootStrapModal(modalId) {
        $("#" + modalId + "").modal({
            show: true,
            backdrop: 'static',
            keyboard: true
        });
    },
    GetQueryString: function () {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    },
    SearchQueryString: function (str) {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf(str) + str.length + 1).split('/');
        return hashes;
    },
    GetFormattedDate: function (date) {
        var msec = Date.parse(date);
        var d = new Date(msec);
        var curr_date = d.getDate();
        var curr_month = d.getMonth();
        curr_month++;
        var curr_year = d.getFullYear();
        var newDate = curr_date + "/" + curr_month + "/" + curr_year;
        return newDate;
    },
    GetDaysMonthDate: function (date) {
        var msec = Date.parse(date);
        var d = new Date(msec);
        var curr_date = d.getDate();
        var curr_month = d.getMonth();
        curr_month++;
        var curr_year = d.getFullYear();
        var newDate = {};
        newDate.days = curr_date;
        newDate.month = curr_month;
        newDate.year = curr_year;
        return newDate;
    },
    GetmonthDate: function (date) {
        var mydate = this.GetDaysMonthDate(date);
        switch (mydate.month) {
            case 1:
                mydate.month = "Jan"; break;
            case 2:
                mydate.month = "Feb"; break;
            case 3:
                mydate.month = "Mar"; break;
            case 4:
                mydate.month = "Apr"; break;
            case 5:
                mydate.month = "May"; break;
            case 6:
                mydate.month = "Jun"; break;
            case 7:
                mydate.month = "Jul"; break;
            case 8:
                mydate.month = "Aug"; break;
            case 9:
                mydate.month = "Sep"; break;
            case 10:
                mydate.month = "Oct"; break;
            case 11:
                mydate.month = "Nov"; break;
            case 12:
                mydate.month = "Dec"; break;
        }

        return mydate;
    },
    Getvideourl: function (videoUrl) {
        var videoId = videoUrl.substring(videoUrl.lastIndexOf('/') + 1);
        return "https://www.youtube.com/watch?v=" + videoId;
    },
    getUrlParameter: function (sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
    },
    getScript: function (source, callback) {
        var script = document.createElement('script');
        var prior = document.getElementsByTagName('script')[0];
        script.async = 1;

        script.onload = script.onreadystatechange = function (_, isAbort) {
            if (isAbort || !script.readyState || /loaded|complete/.test(script.readyState)) {
                script.onload = script.onreadystatechange = null;
                script = undefined;

                if (!isAbort && callback) setTimeout(callback, 0);
            }
        };

        script.src = source;
        prior.parentNode.insertBefore(script, prior);
    },
    waitForEl: function (selector, callback) {
        if ($(selector).length) {
            callback;
        } else {
            setTimeout(function () {
                Helper.waitForEl(selector, callback);
            }, 100);
        }
    },
    ChangeMetaContent: function (metaName, newMetaContent) {
        $("meta").each(function () {
            if ($(this).attr("name") == metaName) {
                $(this).remove();
                $('head').append('<meta name="' + metaName + '" content="' + newMetaContent + '">');
                //   $(this).attr("content", newMetaContent);
            }
        });
    },
    groupBy: function (collection, property) {
        var val, index,
            values = [], result = [];
        for (var i = 0; i < collection.length; i++) {
            val = collection[i][property];
            index = values.indexOf(val);
            if (index > -1)
                result[index].push(collection[i]);
            else {
                values.push(val);
                result.push([collection[i]]);
            }
        }
        return result;
    }

};
var Message = {
    ShowDescription: function (description, title) {
        $("#lbDescription").empty();
        $("#exampleModalLongTitle").empty();
        $("#lbDescription").append(description);
        $("#exampleModalLongTitle").append(title);
        Helper.BootStrapModal("DescriptionPopup");
    },
    ShowPopup: function (title, data) {
        $.confirm({
            title: title,
            content: '',
            onContentReady: function () {
                var self = this;
                this.setContentPrepend(data);
            },
            columnClass: 'medium',
            buttons: {
                cancelAction: {
                    btnClass: 'btn-dark',
                    text: 'اغلاق',
                    function() {
                    }
                }
            }
        });
    },
    ShowNotification: function (message, errorType) {
        Lobibox.notify(errorType, {
            size: 'normal',
            closeButton: false,                  // Show close button or not
            rounded: false,
            delayIndicator: true,
            position: 'top right',
            msg: message

        });
    },
    ShowConfirm: function (title, message, errorType) {
        Lobibox.alert(errorType,
            {
                msg: message,
                title: title
            });
    },
    TakeConfirmation: function (text, txtCancel, messageHeader, messageBody, url) {
        $.confirm({
            icon: 'fa fa-warning',
            animation: 'Rotate',
            closeAnimation: 'Rotate',
            animationBounce: 1.5,
            title: messageHeader,
            content: messageBody,
            autoClose: 'cancelAction|8000',
            buttons: {
                deleteUser: {
                    text: text,
                    btnClass: 'btn-danger',
                    action: function () {
                        window.location = url;
                    }
                },
                cancelAction: {
                    btnClass: 'btn-dark',
                    text: txtCancel,
                    function() {
                    }
                }
            }
        });
    },
    fullScreenConfirm: function (txtConfirm, txtCancel, messageHeader, messageBody, url) {
        $.confirm({
            icon: 'fa fa-warning',
            theme: 'supervan',
            title: messageHeader,
            content: messageBody,
            buttons: {
                confirm: {
                    btnClass: ' btn-purple',
                    text: txtConfirm,
                    action: function () {
                        window.location = url;
                    }
                },
                cancelAction: {
                    text: txtCancel,
                    function() {
                    }
                }
            }
        });
    },
    ShowSuccessToast: function (title) {
        toastr.options = {
            "closeButton": true,
            "debug": true,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-bottom-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "9000",
            "hideDuration": "300",
            "timeOut": "3000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr["success"](title);
    },
    ShowErrorToast: function (title) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "300",
            "timeOut": "3000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr["error"](title);
    },
    ShowInfoToast: function (title) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "300",
            "timeOut": "3000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr["info"](title);
    }
    //ShowPopup: function (title, data) {
    //    $.confirm({
    //        title: title,
    //        content: '',
    //        onContentReady: function () {
    //            var self = this;
    //            this.setContentPrepend(data);
    //        },
    //        columnClass: 'medium',
    //        buttons: {
    //            cancelAction: {
    //                btnClass: 'btn-dark',
    //                text: 'اغلاق',
    //                function() {
    //                }
    //            }
    //        }
    //    });
    //}
}

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            var result = decodeURIComponent(c.substring(name.length, c.length));
            //result = result.replaceAll("%5D", "]");
            //result = result.replaceAll("%5B", "[");
            //result = result.replaceAll("%22", '"');
            //result = result.replaceAll("%2C", ',');
            //result = result.replaceAll("%7B", '{');
            //result = result.replaceAll("%3A", ':');
            //result = result.replaceAll("%7D", '}');
            //result = result.replaceAll("%20", ' ');
            return result;
        }
    }
    return "";
}

function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}


function isPhone(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode == 43) {
        return true;
    }
    else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}