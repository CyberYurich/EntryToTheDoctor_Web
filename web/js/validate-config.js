$(document).ready(function () {
    
    $.validator.addMethod("characters", function(value, element) {
        return this.optional(element) || /^[\- a-zA-Zа-яА-Я]+$/.test(value);
    }, "Введите русские, английские буквы, пробелы и дефисы");
    
    $.validator.addMethod("phone", function(value, element) {
        return this.optional(element) || /^[\-+ ()0-9]+$/.test(value);
    }, "Введите корректный номер телефона");
    
    $.validator.addMethod("shoeSize", function(value, element) {
        return this.optional(element) || /^[\-, 0-9a-zA-Zа-яА-Я]+$/.test(value);
    }, "Для этого поля допустимы цифры, буквы, пробелы, дефисы и запятые");
    
    $("#addEntry").validate({
        rules: {
            date: {
                required: true,
                date: true
            },
            time: {
                required: true
            },
            lastName: {
                characters: true,
                maxlength: 45
            },
            firstName: {
                required: true,
                characters: true,
                maxlength: 45
            },
            middleName: {
                characters: true,
                maxlength: 45
            },
            phone: {
                required: true,
                phone: true,
                maxlength: 30
            },
            email: {
                email: true,
                maxlength: 130
            },
            shoeSize: {
                required: true,
                shoeSize: true,
                maxlength: 15
            }
        },
        messages: {
            date: {
                required: "Выберите дату приема к врачу",
                date: "Введите корректную дату"
            },
            time: {
                required: "На эту дату нет свободного времени"
            },
            lastName: {
                characters: "Для фамилии допустимы только буквы, пробелы и дефисы",
                maxlength: "Длина не должна превышать 45 символов"
            },
            firstName: {
                required: "Введите Ваше имя",
                characters: "Для имени допустимы только буквы, пробелы и дефисы",
                maxlength: "Длина не должна превышать 45 символов"
            },
            middleName: {
                characters: "Для отчества допустимы только буквы, пробелы и дефисы",
                maxlength: "Длина не должна превышать 45 символов"
            },
            phone: {
                required: "Введите контактный номер телефона",
                maxlength: "Длина не должна превышать 30 символов"
            },
            email: {
                email: "Введите корректный email",
                maxlength: "Длина не должна превышать 130 символов"
            },
            shoeSize: {
                required: "Введите Ваш размер обуви",
                maxlength: "Длина не должна превышать 15 символов"
            }
        }
    });
});


