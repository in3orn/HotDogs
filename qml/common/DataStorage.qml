import VPlay 2.0
import QtQuick 2.0

Storage {
    id: storage

//    clearAllAtStartup: true

    function getIngredientData(index) {
        var data = getValue("Ingredient-" + index);
        if(data !== undefined) return data;

        if(index < 1) {
            return {
                purchased: true,
                watched: true
            };
        }

        return {
            purchased: false,
            watched: false
        };
    }

    function setIngredientData(index, data) {
        setValue("Ingredient-" + index, data);

        console.debug("[Settings] Ingredient-" + index + ": " + JSON.stringify(data));
    }

    function getEquipmentData(index) {
        var data = getValue("Equipment-" + index);
        if(data !== undefined) return data;

        return {
            purchased: false,
            watched: false
        };
    }

    function setEquipmentData(index, data) {
        setValue("Equipment-" + index, data);

        console.debug("[Settings] Equipment-" + index + ": " + JSON.stringify(data));
    }

    function getTaskData(index) {
        var data = getValue("Task-" + index);
        if(data !== undefined) return data;

        if(index < 1) {
            return {
                completed: true,
                watched: false
            };
        }

        return {
            completed: false,
            watched: false
        };
    }

    function setTaskData(index, data) {
        setValue("Task-" + index, data);

        console.debug("[Settings] Task-" + index + ": " + JSON.stringify(data));
    }
}
