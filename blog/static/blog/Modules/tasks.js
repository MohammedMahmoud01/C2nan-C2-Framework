// var agentName = getCookie('agentName');
// console.log(agentName);
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

    StartWindowsAttack: function (id) {
        if (id == '1') {
            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/applocker/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "AppLocker Rules Start",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        else if (id == '2') {

            var path = $("#directoryListingPath").val();

            if (path == '' || path == undefined || path == null) {
                $("#directoryListingPathValidation").css("display", "block");
                return;
            }
            else {
                $("#directoryListingPathValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName
            }



            debugger;
            $.ajax({
                url: `/directorylist/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                        //location.href = "/payload-Gen/"
                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })


        }
        else if (id == '3') {

            var url = $("#uRLDownloadWindows").val();

            if (url == '' || url == undefined || url == null) {
                $("#uRLDownloadWindowsValidation").css("display", "block");
                return;
            }
            else {
                $("#uRLDownloadWindowsValidation").css("display", "none");
            }

            var outPath = $("#outPath").val();

            if (outPath == '' || outPath == undefined || outPath == null) {
                $("#outPathValidation").css("display", "block");
                return;
            }
            else {
                $("#outPathValidation").css("display", "none");
            }
            var model = {
                url: url,
                outpath: outpath,
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/download/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        else if (id == '4') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/envvar/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '5') {

            var phraseWindows = $("#phraseWindows").val();

            if (phraseWindows == '' || phraseWindows == undefined || phraseWindows == null) {
                $("#phraseWindowsValidation").css("display", "block");
                return;
            }
            else {
                $("#phraseWindowsValidation").css("display", "none");
            }

            var model = {
                agent: agentName,
                phrase: phraseWindows
            }

            debugger;
            $.ajax({
                url: `/phrasefinder/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '6') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/ipswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '7') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/loggedusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '8') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/netconnections/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '9') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/programs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '10') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/processeswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '11') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/screenshot/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '12') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/userinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '13') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/systeminfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '14') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/updateswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '15') {

            var file_path = $("#filePath").val();

            if (file_path == '' || file_path == undefined || file_path == null) {
                $("#filePathValidation").css("display", "block");
                return;
            }
            else {
                $("#filePathValidation").css("display", "none");
            }

            var destination = $("#fileDestination").val();

            if (destination == '' || destination == undefined || destination == null) {
                $("#fileDestinationValidation").css("display", "block");
                return;
            }
            else {
                $("#fileDestinationValidation").css("display", "none");
            }
            var model = {
                file_path: file_path,
                destination: destination,
                agent: agentName,
                ip: ip
            }
            debugger;
            $.ajax({
                url: `/uploads/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '16') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/windefstat/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '17') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/namedpipes/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        else if (id == '18') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/juicypotato/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
    },


    StartLinuxAttack: function (id) {
        //Apache
        if (id = '19') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/apache/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })
        }
        // Available Shell
        else if (id == '20') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/availableshell/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        // Cronjobs
        else if (id == '21') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/cronjobs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Hidden Files
        else if (id == '22') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/hiddenfiles/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Lsof
        else if (id == '23') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/lsof/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //OS info
        else if (id == '24') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/osinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Processes
        else if (id == '25') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/processeslinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Selinux
        else if (id == '26') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/selinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //SpecialPermissions
        else if (id == '27') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/specialpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //TCP_UDP
        else if (id == '28') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/tcpudp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //usr_priv
        else if (id == '29') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/userpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Usrs info
        else if (id == '30') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/userinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
        //Whoami
        else if (id == '31') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/whoami/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;
                        
                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

                        });

                    } else {
                        Swal.fire({
                            title: "Saved Failed",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'error',
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            })

        }
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
        var html = '';
        if (type == '0')
            TasksData.filterdModules = TasksData.allModules;
        else if (type == '1') {
            html = ` <div class="form-group">
                           <label>Modules</label>
                            <select class="form-control select2bs4" placeholder="Modules"
                                id="selectModules" onchange="TasksDraw.DrawWindowsTask(event)" style="width: 100%;">

                            </select>
                        </div>`;

            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 1);

        }
        else if (type == '2') {
            html = ` <div class="form-group">
                            <label>Modules</label>
                            <select class="form-control select2bs4" placeholder="Modules"
                                id="selectModules" onchange="TasksDraw.DrawLinuxTasks(event)" style="width: 100%;">

                            </select>
                        </div>`;
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 2);
        }

        else {
            html = ` <div class="form-group">
                        <label>Modules</label>
                        <select class="form-control select2bs4" placeholder="Modules"
                            id="selectModules" onchange="TasksDraw.DrawActiveDirectoryList(event)" style="width: 100%;">

                        </select>
                    </div>`;
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 3);
        }


        $.each(TasksData.filterdModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        debugger;



        $("#selectDiv").html(html);

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

        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })
    },

    DrawWindowsTask: function (event) {
        debugger;
        var id = event.target.value;
        // AppLocker
        if (id == '1') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start AppLocker Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        // DirectoryListing
        else if (id == '2') {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="Path">Path</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="directoryListingPath" placeholder="path">
                                <span type="text" class="text-danger font-weight-bold" id="directoryListingPathValidation"
                                style="display: none;">Please Enter Path</span>
                            </div>
                               <div class="col-3">
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  DirectoryListing Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        //Download
        else if (id == '3') {
            var html = `  <div class="col-8">
                           <div class="form-group">
                                <label for="URL">URL</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="uRLDownloadWindows" placeholder="URL">
                                <span type="text" class="text-danger font-weight-bold" id="uRLDownloadWindowsValidation"
                                style="display: none;">Please Enter URL</span>
                            </div>
                            <div class="form-group">
                                <label for="OutPath">OutPath</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="outPath" placeholder="OutPath">
                                <span type="text" class="text-danger font-weight-bold" id="outPathValidation"
                                style="display: none;">Please Enter OutPath</span>
                            </div>
                               <div class="col-3">
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        //env_var
        else if (id == '4') {
            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Env Var Task</button>
                        </div>`

            $("#ModuleTask").html(html);
        }
        //Phrase_finder
        else if (id == '5') {

            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Phrase">Phrase</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="phraseWindows" placeholder="Phrase">
                                    <span type="text" class="text-danger font-weight-bold" id="phraseWindowsValidation"
                                    style="display: none;">Please Enter Phrase</span>
                                </div>
                                <div class="col-3">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Phrase Finder Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        // IPs Task
        else if (id == '6') {

            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start IPs Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //logged_users
        else if (id == '7') {

            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Logged_users Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //Net_Connections
        else if (id == '8') {

            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Net_Connections Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //Programs
        else if (id == '9') {

            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Programs Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //processes
        else if (id == '10') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Processes Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //screenshot
        else if (id == '11') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start ScreenShot Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //user_info
        else if (id == '12') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start User Info Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //Systeminfo
        else if (id == '13') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start System Info Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //Updates
        else if (id == '14') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Updates Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        //Upload
        else if (id == '15') {
            var html = `  <div class="col-8">
                           <div class="form-group">
                                <label for="FilePath">FilePath</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="filePath" placeholder="FilePath">
                                <span type="text" class="text-danger font-weight-bold" id="filePathValidation"
                                style="display: none;">Please Enter FilePath</span>
                            </div>
                            <div class="form-group">
                                <label for="Destination">Destination</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="fileDestination" placeholder="Destination">
                                <span type="text" class="text-danger font-weight-bold" id="fileDestinationValidation"
                                style="display: none;">Please Enter Destination</span>
                            </div>
                               <div class="col-3">
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        // WinDefStat
        else if (id == '16') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Windows Defender Status Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '17') {
            var html = `  <div class="col-4">
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Pipes Task</button>
                          </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '18') {
            var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="URL">Path Of Juicy On Victim</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="pathOfJuicyOnVictim" placeholder="Path">
                            <span type="text" class="text-danger font-weight-bold" id="pathOfJuicyOnVictimValidation"
                            style="display: none;">Please Enter Path</span>
                        </div>               
                            <div class="col-3">
                            <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);
        }
    },

    DrawLinuxTasks: function (event) {
        debugger;
        var strId = event.target.value;
        var id = parseInt(strId);
        if (id >= 19 && id <= 31 ) {
            var html = `  <div class="col-4">
                                    <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                             </div>`

            $("#ModuleTask").html(html);
        }

    },
    DrawActiveDirectoryList: function (event) {
        debugger;
        var id = event.target.value;
        //
        if (id == '19') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Apache Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '20') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Available Shell Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '21') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Cronjobs Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '22') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Hidden Files Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '23') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Lsof Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '24') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start OS info Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '25') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Processes Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '26') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Selinux Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if (id == '27') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Selinux Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
    },
}










$(document).ready(function () {
    TasksData.GetData();
});