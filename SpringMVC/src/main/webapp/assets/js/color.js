const tabsBox = document.querySelector(".tabs-box"),
allTabs = tabsBox.querySelectorAll(".tab");

const tabsBox_size = document.querySelector(".tabs-box-size"),
allTabs_size = tabsBox_size.querySelectorAll(".tab-size");

let isDragging_size = false;
let isDragging = false;

allTabs.forEach(tab => {
    tab.addEventListener("click", () => {
        tabsBox.querySelector(".active").classList.remove("active");
        tab.classList.add("active");
    });
});

const dragging = (e) => {
    if(!isDragging) return;
    tabsBox.classList.add("dragging");
    tabsBox.scrollLeft -= e.movementX;
    handleIcons(tabsBox.scrollLeft)
}

const dragStop = () => {
    isDragging = false;
    tabsBox.classList.remove("dragging");
}

allTabs_size.forEach(tab => {
    tab.addEventListener("click", () => {
        tabsBox_size.querySelector(".active-size").classList.remove("active-size");
        tab.classList.add("active-size");
    });
});

const dragging_size = (e) => {
    if(!isDragging_size) return;
    tabsBox_size.classList.add("dragging_size");
    tabsBox_size.scrollLeft -= e.movementX;
    handleIcons(tabsBox_size.scrollLeft)
}

const dragStop_size = () => {
    isDragging_size = false;
    tabsBox_size.classList.remove("dragging_size");
}

tabsBox.addEventListener("mousedown", () => isDragging = true);
tabsBox.addEventListener("mousemove", dragging);
document.addEventListener("mouseup", dragStop);


tabsBox_size.addEventListener("mousedown", () => isDragging_size = true);
tabsBox_size.addEventListener("mousemove", dragging_size);
document.addEventListener("mouseup", dragStop_size);